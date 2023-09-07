/*
 * Copyright 2023 Abdullah AL Shohag
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

#ifndef AVROADAPTER_H
#define AVROADAPTER_H

#include <QObject>
#include <QMap>
#include <QStringList>

#include "PhoneticSuggestion.h"

class AvroPhonetic : public QObject
{
    Q_OBJECT

    PhoneticSuggestion SuggestionBuilder;
    bool m_processingWords;

public:
    explicit AvroPhonetic(QObject *parent = 0);
    ~AvroPhonetic();

signals:
    void newPredictionSuggestions(QString, QStringList);

public slots:
    void parse(const QString &string);
    void wordCandidateSelected(const QString &word);
};

#endif // AVROADAPTER_H
