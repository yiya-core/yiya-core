// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2019 The Yiya Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef YIYA_QT_YIYAADDRESSVALIDATOR_H
#define YIYA_QT_YIYAADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class YiyaAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit YiyaAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Yiya address widget validator, checks for a valid yiya address.
 */
class YiyaAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit YiyaAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // YIYA_QT_YIYAADDRESSVALIDATOR_H
