function [envVal, suffixOut, otherOpts] = parse_mexopts_for_envval(desiredSuffix, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    envVal = '';
    otherOpts.msvcdir = '';
    otherOpts.msvcver = '';
    otherOpts.platformSDKdir = '';
    % 13 15
    if eq(nargin, 1.0)
        mexopts = fullfile(prefdir, 'mexopts.bat');
    else
        if eq(nargin, 2.0)
            mexopts = varargin{1.0};
        else
            return;
        end % if
        % 22 24
    end % if
    r = loc_scan_mexopts_for_env(mexopts);
    envVal = r.envVal;
    if not(isempty(desiredSuffix))
        if not(strcmp(desiredSuffix, r.tmfSuffix))
            % 28 30
            envVal = '';
        end % if
    end % if
    % 32 34
    if ge(nargout, 2.0)
        suffixOut = r.tmfSuffix;
        if eq(nargout, 3.0)
            otherOpts.msvcdir = r.msvcdir;
            otherOpts.msvcver = r.msvcver;
            otherOpts.platformSDKdir = r.platformSDKdir;
        end % if
    end % if
    % 41 43
function r = loc_scan_mexopts_for_env(mexoptsfile)
    % 43 53
    % 44 53
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    if eq(nargin, 0.0)
        mexoptsfile = '';
    end % if
    % 55 57
    r.msvcdir = '';
    r.msvcver = '';
    r.platformSDKdir = '';
    % 59 62
    % 60 62
    [original_mexoptname, mexopts_content] = locGetOriginalMexFileName(mexoptsfile);
    % 62 64
    switch lower(original_mexoptname)
    case {'bcc55freeopts','bcc55opts','bcc56opts'}
        r.tmfSuffix = '_bc.tmf';
        r.envVal = locGetBccDirFromMexOpts(mexopts_content);
    case {'intelc71opts'}
        % 68 70
        r.tmfSuffix = '_intel.tmf';
        r.envVal = locGetIntelCDirFromMexOpts(mexopts_content);
        % 72 80
        % 73 80
        % 74 80
        % 75 80
        % 76 80
        % 77 80
        % 78 80
    case {'msvc60opts'}
        % 79 81
        r.tmfSuffix = '_vc.tmf';
        r.msvcver = '600';
        msvsdir = locGetVSDirFromMexOpts(mexopts_content);
        r.envVal = fullfile(msvsdir, 'Common', 'msdev98');
        r.msvcdir = fullfile(msvsdir, 'VC98');
    case {'msvc71opts'}
        % 86 88
        r.tmfSuffix = '_vc.tmf';
        r.msvcver = '710';
        msvsdir = locGetVSDirFromMexOpts(mexopts_content);
        r.envVal = fullfile(msvsdir, 'Common7', 'IDE');
        r.msvcdir = fullfile(msvsdir, 'Vc7');
    case {'msvc80opts'}
        % 93 95
        r.tmfSuffix = '_vc.tmf';
        r.msvcver = '800';
        msvsdir = locGetVSDirFromMexOpts(mexopts_content);
        r.envVal = fullfile(msvsdir, 'Common7', 'IDE');
        r.msvcdir = fullfile(msvsdir, 'VC');
    case {'msvc80freeopts'}
        % 100 102
        r.tmfSuffix = '_vc.tmf';
        r.msvcver = '800free';
        [msvsdir, r.platformSDKdir] = locGetVSDirFromMexOpts(mexopts_content);
        r.envVal = fullfile(msvsdir, 'Common7', 'IDE');
        r.msvcdir = fullfile(msvsdir, 'VC');
    case {'openwatc13opts'}
        % 107 109
        r.tmfSuffix = '_watc.tmf';
        r.envVal = locGetWatCDirFromMexOpts(mexopts_content);
    case {'lccopts'}
        r.tmfSuffix = '_lcc.tmf';
        r.envVal = 'lcc';
    otherwise
        r.tmfSuffix = '';
        r.envVal = '';
    end % switch
    % 117 119
    r.envVal = RTW.reduceRelativePath(r.envVal);
    r.msvcdir = RTW.reduceRelativePath(r.msvcdir);
    r.platformSDKdir = RTW.reduceRelativePath(r.platformSDKdir);
    % 121 123
function [original_mexoptname, mexopts_content] = locGetOriginalMexFileName(mexoptsfile)
    % 123 126
    % 124 126
    fid = fopen(mexoptsfile, 'r');
    if eq(fid, -1.0)
        % 127 129
        mexopts_content = '';
        original_mexoptname = '';
    else
        mexopts_content = fread(fid, [1.0 Inf], '*char');
        fclose(fid);
        try
            pat = '\n\s*rem\s+(?<filename>[^\s\.]+)\.bat';
            f = regexpi(mexopts_content, pat, 'names', 'once');
            original_mexoptname = f.filename;
        catch
            mexopts_content = '';
            original_mexoptname = '';
        end % try
    end % if
    % 142 144
function [mexoptsvsdir, mexoptslinkerdir] = locGetVSDirFromMexOpts(mexopts_content)
    % 144 149
    % 145 149
    % 146 149
    % 147 149
    vsinstall_pat = 'VSINSTALLDIR=(?<vsdir>[^\r\n]*)';
    tmp = regexpi(mexopts_content, vsinstall_pat, 'names', 'once');
    if isempty(tmp)
        % 151 153
        old_pat1 = 'MSVCDir=(?<vsdir>.*)[\\/]VC.*[\r\n]';
        tmp = regexpi(mexopts_content, old_pat1, 'names', 'once');
        if isempty(tmp)
            % 155 157
            old_pat2 = 'MSDevDir=(?<vsdevdir>[^\r\n]*)';
            tmp = regexpi(mexopts_content, old_pat2, 'names', 'once');
            if isempty(tmp)
                mexoptsvsdir = '';
            else
                mexoptsvsdir = RTW.reduceRelativePath(fullfile(tmp.vsdevdir, '..', '..'));
            end % if
        else
            mexoptsvsdir = tmp.vsdir;
        end % if
    else
        mexoptsvsdir = tmp.vsdir;
    end % if
    % 169 173
    % 170 173
    % 171 173
    linker_pat = 'LINKERDIR=(?<linkerdir>[^\r\n]*)';
    tmp = regexpi(mexopts_content, linker_pat, 'names', 'once');
    if isempty(tmp)
        mexoptslinkerdir = '';
    else
        mexoptslinkerdir = tmp.linkerdir;
    end % if
    % 179 181
function mexoptsbccdir = locGetBccDirFromMexOpts(mexopts_content)
    % 181 185
    % 182 185
    % 183 185
    pat = 'BORLAND=(?<bccdir>[^\r\n]*)';
    tmp = regexpi(mexopts_content, pat, 'names', 'once');
    if isempty(tmp)
        mexoptsbccdir = '';
    else
        bccdir = tmp.bccdir;
        pat = '(([\\/]bcc55)|([\\/]cbuilder[3456]))?';
        mexoptsbccdir = regexprep(bccdir, pat, '', 'ignorecase');
    end % if
function mexoptsintelcdir = locGetIntelCDirFromMexOpts(mexopts_content)
    % 194 198
    % 195 198
    % 196 198
    pat = 'INTEL=(?<intelcdir>[^\r\n]*)';
    tmp = regexpi(mexopts_content, pat, 'names', 'once');
    if isempty(tmp)
        pat = 'ICPP_COMPILER91=(?<intelcdir>[^\r\n]*)';
        tmp = regexpi(mexopts_content, pat, 'names', 'once');
        if isempty(tmp)
            mexoptsintelcdir = '';
        else
            mexoptsintelcdir = horzcat(tmp.intelcdir, '\IA32');
        end % if
    else
        mexoptsintelcdir = tmp.intelcdir;
    end % if
function mexoptswatcdir = locGetWatCDirFromMexOpts(mexopts_content)
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    pat = 'WATCOM=(?<watcdir>[^\r\n]*)';
    tmp = regexpi(mexopts_content, pat, 'names', 'once');
    if isempty(tmp)
        mexoptswatcdir = '';
    else
        mexoptswatcdir = tmp.watcdir;
    end % if
