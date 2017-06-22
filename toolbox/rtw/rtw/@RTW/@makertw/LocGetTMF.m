function LocGetTMF(h, hModel, rtwroot)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if strcmp(get_param(hModel, 'GenerateMakefile'), 'off')
        return;
    end % if
    % 13 15
    h.TemplateMakefile = deblank(get_param(hModel, 'RTWTemplateMakefile'));
    h.TemplateMakefile = fliplr(deblank(fliplr(h.TemplateMakefile)));
    if isempty(h.TemplateMakefile)
        DAStudio.error('RTW:makertw:tmfUnspecified');
    end % if
    % 19 21
    h.CompilerEnvVal = '';
    if not(any(find(eq(h.TemplateMakefile, '.'))))
        if not(exist(horzcat(h.TemplateMakefile, '.m'), 'file'))
            DAStudio.error('RTW:makertw:invalidTMF');
        end % if
        % 25 28
        % 26 28
        if eq(nargout(h.TemplateMakefile), 3.0)
            [h.TemplateMakefile, h.CompilerEnvVal, h.mexOpts] = feval(h.TemplateMakefile);
        else
            if eq(nargout(h.TemplateMakefile), 2.0)
                [h.TemplateMakefile, h.CompilerEnvVal] = feval(h.TemplateMakefile);
            else
                h.TemplateMakefile = feval(h.TemplateMakefile);
            end % if
        end % if
    end % if
    if ne(exist(h.TemplateMakefile, 'file'), 2.0)
        file = LocGetTMFFromRTWRoot(h, rtwroot, 'c', h.TemplateMakefile);
        if not(isempty(file))
            h.TemplateMakefile = file;
        else
            DAStudio.error('RTW:makertw:tmfUnavailable', h.TemplateMakefile);
        end % if
    else
        h.TemplateMakefile = which(h.TemplateMakefile);
    end % if
