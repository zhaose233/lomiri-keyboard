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

#include <iostream>

#include <iconv.h>
#include <string>
#include <string.h>

#include <QFile>
#include <QTextStream>
#include <QChar>
#include <QCoreApplication>

#include "AvroPhonetic"

AvroPhonetic::AvroPhonetic(QObject *parent) : QObject(parent),
                                            m_processingWords(false)
{
}

AvroPhonetic::~AvroPhonetic()
{
}

void AvroPhonetic::parse(const QString &string)
{
    Q_EMIT newPredictionSuggestions(string, SuggestionBuilder.Suggest(string));
}

void AvroPhonetic::wordCandidateSelected(const QString &word)
{
    Q_UNUSED(word);
}
