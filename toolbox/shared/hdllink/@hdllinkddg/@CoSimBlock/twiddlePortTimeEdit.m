function twiddlePortTimeEdit(this, dialog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    switch this.PortModeEdit
    case 'Input'
        dialog.setWidgetValue('PortTimeEdit', 'N/A');
        dialog.setEnabled('PortTimeEdit', 0.0);
        dialog.setEnabled('PortSignEdit', 0.0);
        dialog.setWidgetValue('PortFracEdit', 'N/A');
        dialog.setEnabled('PortFracEdit', 0.0);
    case 'Output'
        if strcmp(dialog.getWidgetValue('PortTimeEdit'), 'N/A')
            PortTimes = strread(this.PortTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
            % 17 19
            dialog.setWidgetValue('PortTimeEdit', PortTimes{this.CurPortRow});
        end % if
        dialog.setEnabled('PortTimeEdit', 1.0);
        % 21 23
        dialog.setEnabled('PortSignEdit', 1.0);
        switch this.PortSignEdit
        case 'Inherit'
            dialog.setWidgetValue('PortFracEdit', 'N/A');
            dialog.setEnabled('PortFracEdit', 0.0);
        case {'Unsigned','Signed'}
            if strcmp(dialog.getWidgetValue('PortFracEdit'), 'N/A')
                PortFracs = strread(this.PortFracLengths(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
                % 30 32
                dialog.setWidgetValue('PortFracEdit', PortFracs{this.CurPortRow});
            end % if
            dialog.setEnabled('PortFracEdit', 1.0);
        end % switch
    otherwise
        error('CoSim::twiddlePortTimeEdit: Invalid port mode.')
    end % switch
