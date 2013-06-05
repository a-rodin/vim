/*****************************************************************************
 * <+call:printf("%-74s", expand("%:t")." - QStarDict, a StarDict clone written with using Qt")+>*
 * Copyright (C) <+call:strftime("%Y")+> <+call:printf("%-55s", g:tskelUserName)+>*
 *                                                                           *
 * This program is free software; you can redistribute it and/or modify      *
 * it under the terms of the GNU General Public License as published by      *
 * the Free Software Foundation; either version 2 of the License, or         *
 * (at your option) any later version.                                       *
 *                                                                           *
 * This program is distributed in the hope that it will be useful,           *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of            *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the             *
 * GNU General Public License for more details.                              *
 *                                                                           *
 * You should have received a copy of the GNU General Public License along   *
 * with this program; if not, write to the Free Software Foundation, Inc.,   *
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.               *
 *****************************************************************************/
<+call:eval('findfile(expand("%:t:r").".h", ".;") != "" ? "\n#include \"".findfile(expand("%:r:t").".h", ".;")."\"\n" : ""')+><+call:eval('findfile(expand("%:t:r").".h", ".;") != "" ? "<+CURSOR+>".GenImpl(findfile(expand("%:r:t").".h", ".;")) : "\n<+CURSOR+>\n"')+>
// vim: tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent textwidth=120 formatoptions=tc

