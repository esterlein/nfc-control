#pragma once

#include <QObject>
#include <QNearFieldManager>

class NFCManager : public QObject
{
    Q_OBJECT

public:
    explicit NFCManager(QObject* parent = 0);

private:
    QNearFieldManager* m_nfcManager;

public slots:
    void startNfcDetection();
    void stopNfcDetection();
    void targetDetected(QNearFieldTarget* target);
    void targetLost(QNearFieldTarget* target);
};
