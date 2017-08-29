#include <QDebug>
#include "NFCManager.h"
#include "NDEFRecord.h"

NFCManager::NFCManager(QObject* parent) :
    QObject(parent),
    m_nfcManager(new QNearFieldManager(this))
{
    connect(m_nfcManager, SIGNAL(targetDetected(QNearFieldTarget*)), this, SLOT(targetDetected(QNearFieldTarget*)));
    connect(m_nfcManager, SIGNAL(targetLost(QNearFieldTarget*)), this, SLOT(targetLost(QNearFieldTarget*)));

    startNfcDetection();
}

void NFCManager::startNfcDetection()
{
    m_nfcManager->startTargetDetection();
}

void NFCManager::stopNfcDetection()
{
    m_nfcManager->stopTargetDetection();
}

void NFCManager::targetDetected(QNearFieldTarget* target)
{
    connect(target, SIGNAL(ndefMessageRead(QNdefMessage)), this, SLOT(ndefMessageRead(QNdefMessage)));
    connect(target, SIGNAL(ndefMessagesWritten()), this, SLOT(ndefMessageWritten()));
    connect(target, SIGNAL(error(QNearFieldTarget::Error, QNearFieldTarget::RequestId)), this, SLOT(targetError(QNearFieldTarget::Error, QNearFieldTarget::RequestId)));

    m_request = target->readNdefMessages();
    if(!m_request.isValid()){
        targetError(QNearFieldTarget::NdefReadError, m_request);
    }

    /*NDEFRecord record;
    record.setTag(1);
    QNdefMessage message(record);
    m_request = target->writeNdefMessages(QList<QNdefMessage>() << message);
    if(!m_request.isValid()){
        targetError(QNearFieldTarget::NdefWriteError, m_request);
    }*/
}

void NFCManager::ndefMessageRead(QNdefMessage message)
{
    /*for(int i = 0; i < message.size(); ++i){
        qDebug() << message.at(i).payload();
    }*/
    m_nfcRecord = message.at(0).payload().remove(0, 3);
    qDebug() << m_nfcRecord;
}

void NFCManager::ndefMessageWritten()
{
    qDebug() << "written";
}

void NFCManager::targetError(QNearFieldTarget::Error error, QNearFieldTarget::RequestId request)
{

}

void NFCManager::targetLost(QNearFieldTarget* target)
{
    target->deleteLater();
}














/*switch(m_touchAction){
    case NoAction:
        break;
    case ReadNdef:
        connect(target, SIGNAL(ndefMessageRead(QNdefMessage)), this, SLOT(ndefMessageRead(QNdefMessage)));
        connect(target, SIGNAL(error(QNearFieldTarget::Error,QNearFieldTarget::RequestId)), this, SLOT(targetError(QNearFieldTarget::Error,QNearFieldTarget::RequestId)));

        m_request = target->readNdefMessages();
        if (!m_request.isValid()){
            targetError(QNearFieldTarget::NdefReadError, m_request);
        }
        break;
    case WriteNdef:
        connect(target, SIGNAL(ndefMessagesWritten()), this, SLOT(ndefMessageWritten()));
        connect(target, SIGNAL(error(QNearFieldTarget::Error,QNearFieldTarget::RequestId)), this, SLOT(targetError(QNearFieldTarget::Error,QNearFieldTarget::RequestId)));

        m_request = target->writeNdefMessages(QList<QNdefMessage>() << ndefMessage());
        if (!m_request.isValid()){
            targetError(QNearFieldTarget::NdefWriteError, m_request);
        }
        break;
}*/
