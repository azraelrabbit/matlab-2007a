function att = v1convert_att(this, att, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    att = this.v1convert_table(att, varargin{:});
    % 9 10
    switch varargin{1.0}
    case 'csl_mdl_proptable'
        att.ObjectType = 'Model';
    case 'csl_sys_proptable'
        att.ObjectType = 'System';
    case 'csl_blk_proptable'
        att.ObjectType = 'Block';
    case 'csl_sig_proptable'
        att.ObjectType = 'Signal';
    end % switch
end % function
