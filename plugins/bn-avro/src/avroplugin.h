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

#ifndef AVROPLUGIN_H
#define AVROPLUGIN_H

#include <QObject>
#include <QStringList>
#include <QThread>

#include "languageplugininterface.h"
#include "abstractlanguageplugin.h"

#include "AvroPhonetic"

class AvroLanguageFeatures;

class AvroPlugin : public AbstractLanguagePlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.Examples.AvroPlugin" FILE "avroplugin.json")
    Q_INTERFACES(LanguagePluginInterface)

public:
    explicit AvroPlugin(QObject *parent = 0);
    virtual ~AvroPlugin();
    
    virtual void predict(const QString& surroundingLeft, const QString& preedit);
    virtual void wordCandidateSelected(QString word);

    virtual AbstractLanguageFeatures* languageFeature();

    //! spell checker
    virtual void spellCheckerSuggest(const QString& word, int limit) { Q_UNUSED(word); Q_UNUSED(limit); }
    virtual void addToSpellCheckerUserWordList(const QString& word) { Q_UNUSED(word); }
    virtual bool setLanguage(const QString& languageId, const QString& pluginPath) { Q_UNUSED(languageId); Q_UNUSED(pluginPath); return false; }

signals:
    void newPredictionSuggestions(QString word, QStringList suggestions);
    void parsePredictionText(QString preedit);
    void candidateSelected(QString word);
    
public slots:
    void finishedProcessing(QString word, QStringList suggestions);
    
private:
    QThread *m_avroThread;
    AvroPhonetic *m_AvroPhonetic;
    AvroLanguageFeatures* m_avroLanguageFeatures;
    QString m_nextWord;
    bool m_processingWord;
};

#endif // AVROPLUGIN_H
