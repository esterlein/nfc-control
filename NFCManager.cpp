#include "NFCManager.h"

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
    connect(target, SIGNAL(error(QNearFieldTarget::Error, QNearFieldTarget::RequestId)), this, SLOT(targetError(QNearFieldTarget::Error,QNearFieldTarget::RequestId)));

    m_request = target->readNdefMessages();
    if(!m_request.isValid()){
        targetError(QNearFieldTarget::NdefReadError, m_request);
    }
}

void NFCManager::targetLost(QNearFieldTarget* target)
{
    target->deleteLater();
}

void NFCManager::targetError(QNearFieldTarget::Error error, QNearFieldTarget::RequestId request)
{

}

void NFCManager::ndefMessageRead(QNdefMessage* message)
{

}

void NFCManager::ndefMessageWritten()
{

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
