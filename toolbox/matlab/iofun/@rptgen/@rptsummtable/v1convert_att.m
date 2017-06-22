function att2 = v1convert_att(this, att1, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    this.LoopType = att1.ObjectType;
    % 9 10
    att2.TitleType = att1.TitleType(2.0:end);
    att2.TableTitle = att1.TableTitle;
    % 12 14
    % 13 14
    summSrc = this.summ_get;
    % 15 16
    try
        summSrc.LoopComp = RptgenML.v1convert(getfield(att1, horzcat(att1.ObjectType, 'Component')));
    catch
        warning('rptgen:SummaryTableLoopConvert', lasterr);
    end % try
    % 21 22
    summSrc.Properties = getfield(att1, horzcat(att1.ObjectType, 'Parameters'));
    summSrc.Anchor = getfield(att1, horzcat('is', att1.ObjectType, 'Anchor'));
end % function
