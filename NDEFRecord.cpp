#include <QDataStream>
#include "NDEFRecord.h"

/*NDEFRecord::NDEFRecord(QNdefRecord* parent) :
    QNdefRecord(parent)
{

}*/

int NDEFRecord::tag() const
{
    int tag;
    QDataStream ds(QNdefRecord::payload());
    ds >> tag;
    return tag;
}

void NDEFRecord::setTag(int value)
{
    QByteArray ba;
    QDataStream ds(&ba, QIODevice::WriteOnly);
    ds << value;
    QNdefRecord::setPayload(ba);
}
