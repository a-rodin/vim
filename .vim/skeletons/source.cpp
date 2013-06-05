/*****************************************************************************
 * <+call:printf("%-74s", expand("%:t"))+>*
 * Copyright (C) <+call:strftime("%Y")+> <+call:printf("%-55s", g:tskelUserName)+>*
 *****************************************************************************/
<+call:eval('findfile(expand("%:r:t").".h", ".;") != "" ? "\n#include \"".findfile(expand("%:r:t").".h", ".;")."\"\n" : ""')+><+call:eval('findfile(expand("%:r:t").".h", ".;") != "" ? "<+CURSOR+>".GenImpl(findfile(expand("%:r:t").".h", ".;")) : "\n<+CURSOR+>\n"')+>
// vim: tabstop=4 softtabstop=4 shiftwidth=4 expandtab cindent

