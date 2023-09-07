/*
 *  OpenBangla Keyboard
 *  Copyright (C) 2015-2016 Muhammad Mominul Huque <mominul2082@gmail.com>
 *  Modified to adapt with Qt
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

/* Logging functions */

#ifndef LOG_H
#define LOG_H

#include <QDebug>

#define LOG_INFO(a...) qDebug("[AvroPlugin-Info]: " a)

#if DEBUG
#define LOG_DEBUG(a...) qDebug("[AvroPlugin-Debug]: " a)
#else
#define LOG_DEBUG(a...)
#endif

#define LOG_ERROR(a...) qDebug("[AvroPlugin-Error]: " a)

#endif // LOG_H
