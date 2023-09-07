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

#include <QDebug>

#include "avroplugin.h"
#include "avrolanguagefeatures.h"

AvroPlugin::AvroPlugin(QObject *parent) :
    AbstractLanguagePlugin(parent)
  , m_avroLanguageFeatures(new AvroLanguageFeatures)
  , m_processingWord(false)
{
    m_avroThread = new QThread();
    m_AvroPhonetic = new AvroPhonetic();
    m_AvroPhonetic->moveToThread(m_avroThread);

    connect(m_AvroPhonetic, SIGNAL(newPredictionSuggestions(QString, QStringList)), this, SLOT(finishedProcessing(QString, QStringList)));
    connect(this, SIGNAL(parsePredictionText(QString)), m_AvroPhonetic, SLOT(parse(QString)));
    connect(this, SIGNAL(candidateSelected(QString)), m_AvroPhonetic, SLOT(wordCandidateSelected(QString)));
    m_avroThread->start();
}

AvroPlugin::~AvroPlugin()
{
    m_AvroPhonetic->deleteLater();
    m_avroThread->quit();
    m_avroThread->wait();
}

void AvroPlugin::predict(const QString& surroundingLeft, const QString& preedit)
{
    Q_UNUSED(surroundingLeft);
    m_nextWord = preedit;
    if (!m_processingWord) {
        m_processingWord = true;
        Q_EMIT parsePredictionText(preedit);
    }
}

void AvroPlugin::wordCandidateSelected(QString word)
{
    Q_EMIT candidateSelected(word);
}

AbstractLanguageFeatures* AvroPlugin::languageFeature()
{
    return m_avroLanguageFeatures;
}

void AvroPlugin::finishedProcessing(QString word, QStringList suggestions)
{
    Q_EMIT newPredictionSuggestions(word, suggestions);
    if (word != m_nextWord) {
        Q_EMIT(parsePredictionText(word));
    } else {
        m_processingWord = false;
    }
}
