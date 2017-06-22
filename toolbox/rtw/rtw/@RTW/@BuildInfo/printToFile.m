function printToFile(h, varargin)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    switch nargin
    case 2.0
        filename = varargin{1.0};
        group = '';
    case 3.0
        filename = varargin{1.0};
        group = varargin{2.0};
    otherwise
        DAStudio.error('RTW:buildInfo:printToFileUsage');
    end % switch
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    pinfo = locSetPrintInfo(filename);
    if isempty(pinfo)
        DAStudio.error('RTW:utility:fileIOError', filename, 'open');
    end % if
    % 34 35
    fprintf(pinfo.fid, '%s\n', pinfo.hsep{1.0});
    % 36 37
    if not(isempty(group))
        fprintf(pinfo.fid, 'BuildInfo contents (Group ''%s'' only)\n', group);
    else
        % 40 41
        fprintf(pinfo.fid, 'BuildInfo contents\n');
    end % if
    % 43 45
    % 44 45
    locDumpOptions(h, group, pinfo, 2.0);
    % 46 48
    % 47 48
    locDumpIncludeFiles(h, group, pinfo, 2.0)
    locDumpIncludePaths(h, group, pinfo, 2.0);
    % 50 52
    % 51 52
    locDumpSourceFiles(h, group, pinfo, 2.0)
    locDumpSourcePaths(h, group, pinfo, 2.0)
    % 54 56
    % 55 56
    locDumpLibraries(h, group, pinfo, 2.0)
    % 57 58
    fclose(pinfo.fid);
end % function
function pinfo = locSetPrintInfo(filename)
    % 61 79
    % 62 79
    % 63 79
    % 64 79
    % 65 79
    % 66 79
    % 67 79
    % 68 79
    % 69 79
    % 70 79
    % 71 79
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    % 78 79
    pinfo = [];
    pinfo.fid = fopen(filename, 'w');
    if eq(pinfo.fid, -1.0)
        pinfo = [];
        return;
    end % if
    % 85 86
    pinfo.indent = '   ';
    pinfo.hsep{1.0} = '===============================================================================';
    pinfo.hsep{2.0} = '----------------------------------------------------------------------------';
    pinfo.hsep{3.0} = '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~';
    pinfo.hsep{4.0} = '++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++';
end % function
function locDumpOptions(h, group, pinfo, lvl)
    % 93 114
    % 94 114
    % 95 114
    % 96 114
    % 97 114
    % 98 114
    % 99 114
    % 100 114
    % 101 114
    % 102 114
    % 103 114
    % 104 114
    % 105 114
    % 106 114
    % 107 114
    % 108 114
    % 109 114
    % 110 114
    % 111 114
    % 112 114
    % 113 114
    indent = '';
    for i=2.0:lvl
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 118 120
    % 119 120
    if ne(length(h.Options.Defines), 0.0)
        fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
        fprintf(pinfo.fid, '%sPreprocessor defines\n', indent);
        defs = h.getDefines();
        for i=1.0:length(defs)
            if isempty(group) || strcmp(group, h.Options.Defines(i).Group)
                fprintf(pinfo.fid, '%s%s(%-10.10s)   %s\n', indent, pinfo.indent, h.Options.Defines(i).Group, defs{i});
                % 127 128
            end % if
        end % for
    end % if
    % 131 133
    % 132 133
    if ne(length(h.Options.CompileFlags), 0.0)
        fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
        fprintf(pinfo.fid, '%sCompile Flags\n', indent);
        for i=1.0:length(h.Options.CompileFlags)
            if isempty(group) || strcmp(group, h.Options.CompileFlags(i).Group)
                fprintf(pinfo.fid, '%s%s(%-10.10s)   %s\n', indent, pinfo.indent, h.Options.CompileFlags(i).Group, h.Options.CompileFlags(i).Value);
                % 139 140
            end % if
        end % for
    end % if
    % 143 145
    % 144 145
    if ne(length(h.Options.LinkFlags), 0.0)
        fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
        fprintf(pinfo.fid, '%sLink Flags\n', indent);
        for i=1.0:length(h.Options.LinkFlags)
            if isempty(group) || strcmp(group, h.Options.LinkFlags(i).Group)
                fprintf(pinfo.fid, '%s%s(%-10.10s)   %s\n', indent, pinfo.indent, h.Options.LinkFlags(i).Group, h.Options.LinkFlags(i).Value);
                % 151 152
            end % if
        end % for
    end % if
end % function
function locDumpIncludeFiles(h, group, pinfo, lvl)
    % 157 178
    % 158 178
    % 159 178
    % 160 178
    % 161 178
    % 162 178
    % 163 178
    % 164 178
    % 165 178
    % 166 178
    % 167 178
    % 168 178
    % 169 178
    % 170 178
    % 171 178
    % 172 178
    % 173 178
    % 174 178
    % 175 178
    % 176 178
    % 177 178
    indent = '';
    title_indent = '';
    for i=2.0:lvl
        % 181 182
        title_indent = indent;
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 185 186
    if not(isempty(h.Src.Files))
        fprintf(pinfo.fid, '%s%s\n', title_indent, pinfo.hsep{minus(lvl, 1.0)});
        fprintf(pinfo.fid, '%sInclude Files\n', title_indent);
        for i=1.0:length(h.Inc.Files)
            if isempty(group) || strcmp(group, h.Inc.Files(i).Group)
                fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
                fprintf(pinfo.fid, '%s(%-10.10s)   %s/%s\n', indent, h.Inc.Files(i).Group, h.Inc.Files(i).Path, h.Inc.Files(i).FileName);
                % 193 195
                % 194 195
            end % if
        end % for
    end % if
end % function
function locDumpIncludePaths(h, group, pinfo, lvl)
    % 200 221
    % 201 221
    % 202 221
    % 203 221
    % 204 221
    % 205 221
    % 206 221
    % 207 221
    % 208 221
    % 209 221
    % 210 221
    % 211 221
    % 212 221
    % 213 221
    % 214 221
    % 215 221
    % 216 221
    % 217 221
    % 218 221
    % 219 221
    % 220 221
    indent = '';
    title_indent = '';
    for i=2.0:lvl
        % 224 225
        title_indent = indent;
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 228 229
    if not(isempty(h.Inc.Paths))
        fprintf(pinfo.fid, '%s%s\n', title_indent, pinfo.hsep{minus(lvl, 1.0)});
        fprintf(pinfo.fid, '%sInclude Paths\n', title_indent);
        for i=1.0:length(h.Inc.Paths)
            if isempty(group) || strcmp(group, h.Inc.Paths(i).Group)
                fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
                fprintf(pinfo.fid, '%s(%-10.10s)   %s\n', indent, h.Inc.Paths(i).Group, h.Inc.Paths(i).Value);
                % 236 237
            end % if
        end % for
    end % if
end % function
function locDumpSourceFiles(h, group, pinfo, lvl)
    % 242 262
    % 243 262
    % 244 262
    % 245 262
    % 246 262
    % 247 262
    % 248 262
    % 249 262
    % 250 262
    % 251 262
    % 252 262
    % 253 262
    % 254 262
    % 255 262
    % 256 262
    % 257 262
    % 258 262
    % 259 262
    % 260 262
    % 261 262
    indent = '';
    title_indent = '';
    for i=2.0:lvl
        % 265 266
        title_indent = indent;
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 269 270
    if not(isempty(h.Src.Files))
        fprintf(pinfo.fid, '%s%s\n', title_indent, pinfo.hsep{minus(lvl, 1.0)});
        fprintf(pinfo.fid, '%sSource Files\n', title_indent);
        for i=1.0:length(h.Src.Files)
            if isempty(group) || strcmp(group, h.Src.Files(i).Group)
                fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
                fprintf(pinfo.fid, '%s(%-10.10s)   %s/%s\n', indent, h.Src.Files(i).Group, h.Src.Files(i).Path, h.Src.Files(i).FileName);
                % 277 280
                % 278 280
                % 279 280
                locDumpOptions(h.Src.Files(i), group, pinfo, plus(lvl, 1.0));
            end % if
        end % for
    end % if
end % function
function locDumpSourcePaths(h, group, pinfo, lvl)
    % 286 307
    % 287 307
    % 288 307
    % 289 307
    % 290 307
    % 291 307
    % 292 307
    % 293 307
    % 294 307
    % 295 307
    % 296 307
    % 297 307
    % 298 307
    % 299 307
    % 300 307
    % 301 307
    % 302 307
    % 303 307
    % 304 307
    % 305 307
    % 306 307
    indent = '';
    title_indent = '';
    for i=2.0:lvl
        % 310 311
        title_indent = indent;
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 314 315
    if not(isempty(h.Src.Paths))
        fprintf(pinfo.fid, '%s%s\n', title_indent, pinfo.hsep{minus(lvl, 1.0)});
        fprintf(pinfo.fid, '%sSource Paths\n', title_indent);
        for i=1.0:length(h.Src.Paths)
            if isempty(group) || strcmp(group, h.Src.Paths(i).Group)
                fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
                fprintf(pinfo.fid, '%s(%-10.10s)   %s\n', indent, h.Src.Paths(i).Group, h.Src.Paths(i).Value);
                % 322 323
            end % if
        end % for
    end % if
end % function
function locDumpLibraries(h, group, pinfo, lvl)
    % 328 348
    % 329 348
    % 330 348
    % 331 348
    % 332 348
    % 333 348
    % 334 348
    % 335 348
    % 336 348
    % 337 348
    % 338 348
    % 339 348
    % 340 348
    % 341 348
    % 342 348
    % 343 348
    % 344 348
    % 345 348
    % 346 348
    % 347 348
    indent = '';
    for i=2.0:lvl
        % 350 351
        indent = horzcat(indent, pinfo.indent);
    end % for
    % 353 354
    if isempty(h.LinkObj)
        return;
    end % if
    % 357 359
    % 358 359
    fprintf(pinfo.fid, '%s\nLibraries\n', pinfo.hsep{minus(lvl, 1.0)});
    for i=1.0:length(h.LinkObj)
        % 361 362
        fprintf(pinfo.fid, '%s%s\n', indent, pinfo.hsep{lvl});
        fprintf(pinfo.fid, '%s(%-10.10s)   %s/%s\n', indent, h.LinkObj(i).Group, h.LinkObj(i).Path, h.LinkObj(i).Name);
        % 364 367
        % 365 367
        % 366 367
        locDumpOptions(h.LinkObj(i), group, pinfo, plus(lvl, 1.0));
        % 368 370
        % 369 370
        locDumpIncludeFiles(h.LinkObj(i), group, pinfo, plus(lvl, 1.0))
        locDumpIncludePaths(h.LinkObj(i), group, pinfo, plus(lvl, 1.0));
        % 372 374
        % 373 374
        locDumpSourceFiles(h.LinkObj(i), group, pinfo, plus(lvl, 1.0))
        locDumpSourcePaths(h.LinkObj(i), group, pinfo, plus(lvl, 1.0))
    end % for
end % function
