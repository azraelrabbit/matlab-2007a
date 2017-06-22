function fcns = menus_cbs(hFDA)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    fcns = siggui_cbs(hFDA);
    fcns.new_cb = @new_cb;
    fcns.open_cb = cellhorzcat(fcns.method, hFDA, 'load');
    fcns.save_cb = cellhorzcat(fcns.method, hFDA, 'save');
    fcns.saveas_cb = cellhorzcat(fcns.method, hFDA, 'saveas');
    % 23 25
    fcns.export_cb = cellhorzcat(fcns.method, hFDA, 'export');
    fcns.print_cb = cellhorzcat(fcns.event, hFDA, 'Print');
    fcns.printprev_cb = cellhorzcat(fcns.event, hFDA, 'PrintPreview');
    fcns.fullviewanalysis_cb = cellhorzcat(fcns.event, hFDA, 'FullViewAnalysis');
    fcns.exit_cb = cellhorzcat(@exit_cb, hFDA);
    fcns.convertstruct = cellhorzcat(fcns.method, hFDA, 'convert');
    fcns.convert2sos = cellhorzcat(@sos_cb, hFDA);
    fcns.reordersos = cellhorzcat(fcns.method, hFDA, 'sos');
end % function
function savecoeffs_cb(hcbo, eventStruct)
    % 34 41
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    warning('savecoeffs_cb not yet implemented');
end % function
function savespecs_cb(hcbo, eventStruct)
    % 43 46
    % 44 46
    warning('savespecs_cb not yet implemented');
end % function
function new_cb(hcbo, eventStruct)
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    fdatool;
end % function
function sos_cb(hcbo, eventStruct, hFDA)
    % 55 86
    % 56 86
    % 57 86
    % 58 86
    % 59 86
    % 60 86
    % 61 86
    % 62 86
    % 63 86
    % 64 86
    % 65 86
    % 66 86
    % 67 86
    % 68 86
    % 69 86
    % 70 86
    % 71 86
    % 72 86
    % 73 86
    % 74 86
    % 75 86
    % 76 86
    % 77 86
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    Hd = sos(getfilter(hFDA));
    % 86 88
    opts.mcode = 'Hd = sos(Hd);';
    % 88 90
    hFDA.setfilter(Hd, opts);
end % function
function exit_cb(hcbo, eventStruct, hFDA)
    % 92 96
    % 93 96
    % 94 96
    if strcmpi(get(hFDA.FigureHAndle, 'tag'), 'initializing')
        % 96 99
        % 97 99
        d = dbstack;
        if eq(length(d), 1.0)
            delete(hFDA.FigureHandle);
        end % if
    else
        % 103 105
        flags = getflags(hFDA);
        % 105 108
        % 106 108
        if flags.calledby.dspblks
            set(hFDA, 'Visible', 'Off');
        else
            if flags.forceclose
                close(hFDA, 'force');
            else
                close(hFDA);
            end % if
        end % if
    end % if
end % function
