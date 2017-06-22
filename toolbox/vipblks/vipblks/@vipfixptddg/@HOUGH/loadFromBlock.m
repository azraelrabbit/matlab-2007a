function loadFromBlock(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.theta_res = this.Block.theta_res;
    this.rho_res = this.Block.rho_res;
    this.out_theta_rho = strcmpi(this.Block.out_theta_rho, 'on');
    this.outdtmode = this.Block.outdtmode;
    % 14 15
    this.FixptDialog.loadFromBlock;
end % function
