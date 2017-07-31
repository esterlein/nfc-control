#include "NFCManager.h"

NFCManager::NFCManager(QObject* parent) :
    QObject(parent),
    m_nfcManager(new QNearFieldManager(this))
{
    connect(m_manager, SIGNAL(targetDetected(QNearFieldTarget*)), this, SLOT(targetDetected(QNearFieldTarget*)));
    connect(m_manager, SIGNAL(targetLost(QNearFieldTarget*)), this, SLOT(targetLost(QNearFieldTarget*)));
}

void NFCManager::startNfcDetection()
{
    m_nfcManager->startTargetDetection();
}

void NFCManager::stopNfcDetection()
{
    m_nfcManager->stopTargetDetection();
}

void NFCManager::targetDetected()
{

}

void NFCManager::targetLost()
{

}
