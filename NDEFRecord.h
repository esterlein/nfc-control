#pragma once

#include <QNdefRecord>

class NDEFRecord : public QNdefRecord
{
public:
    Q_DECLARE_NDEF_RECORD(NDEFRecord, QNdefRecord::ExternalRtd, "transcash.com:f", QByteArray(sizeof(int), char(0)))

    int tag() const;
    void setTag(int value);
};

Q_DECLARE_ISRECORDTYPE_FOR_NDEF_RECORD(NDEFRecord, QNdefRecord::ExternalRtd, "transcash.com:f")
