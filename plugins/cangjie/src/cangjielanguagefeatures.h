/*
 * Copyright 2016 Canonical Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef CANGJIELANGUAGEFEATURES_H
#define CANGJIELANGUAGEFEATURES_H

#include "abstractlanguagefeatures.h"
#include <QObject>

class CangjieLanguageFeatures : public QObject, public AbstractLanguageFeatures
{
    Q_OBJECT
public:
    explicit CangjieLanguageFeatures(QObject *parent = 0);
    virtual ~CangjieLanguageFeatures();

    virtual bool alwaysShowSuggestions() const;
    virtual bool autoCapsAvailable() const;
    virtual bool activateAutoCaps(const QString &preedit) const;
    virtual QString appendixForReplacedPreedit(const QString &preedit) const;
    virtual bool isSeparator(const QString &text) const;
    virtual bool isSymbol(const QString &text) const;
    virtual bool ignoreSimilarity() const;
    virtual bool wordEngineAvailable() const;
    virtual QString fullStopSequence() const;
    virtual bool restorePreedit() const;
    virtual bool commitOnSpace() const;
    virtual bool showPrimaryInPreedit() const;
};

#endif // CHINESELANGUAGEFEATURES_H
