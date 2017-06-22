function att2 = v1convert_att(this, att1, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if strcmpi(att1.ObjectType, 'fpblock')
        this.LoopType = 'fixed-point block';
    else
        % 13 15
        % 14 15
        this.LoopType = att1.ObjectType;
    end % if
    % 17 18
    att2.TitleType = att1.TitleType(2.0:end);
    att2.TableTitle = att1.TableTitle;
    % 20 22
    % 21 22
    summSrc = this.summ_get;
    % 23 24
    try
        summSrc.LoopComp = RptgenML.v1convert(getfield(att1, horzcat(att1.ObjectType, 'Component')));
    catch
        warning('rptgen:SummaryTableLoopConvert', lasterr);
    end % try
    % 29 30
    summSrc.Properties = getfield(att1, horzcat(att1.ObjectType, 'Parameters'));
    summSrc.Anchor = getfield(att1, horzcat('is', att1.ObjectType, 'Anchor'));
end % function
