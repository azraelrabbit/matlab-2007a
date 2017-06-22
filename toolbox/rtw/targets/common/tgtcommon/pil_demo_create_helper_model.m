function pil_demo_create_helper_model(target_block, save_model, alg_blocks)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    error(nargchk(3.0, 3.0, nargin, 'struct'));
    % 22 23
    target_block_model = get_param(target_block, 'Parent');
    target_block_name = get_param(target_block, 'Name');
    % 25 26
    load_system('pil_demo_lib');
    % 27 28
    width = 400.0;
    height = 100.0;
    x = 15.0;
    y = 110.0;
    verticalGap = 10.0;
    for i=1.0:length(alg_blocks)
        alg_block = alg_blocks{i};
        % 35 36
        y = plus(y, mtimes(plus(height, verticalGap), minus(i, 1.0)));
        % 37 38
        block = add_block('pil_demo_lib/Verification Example', horzcat(target_block_model, '/verify_', num2str(i)), 'Position', horzcat(x, y, plus(x, width), plus(y, height)));
        % 39 43
        % 40 43
        % 41 43
        % 42 43
        set_param(block, 'simulationBlock', alg_block);
        set_param(block, 'targetBlock', horzcat(save_model, '/', target_block_name));
    end % for
    origLocation = get_param(target_block_model, 'Location');
    origX = origLocation(1.0);
    origY = origLocation(2.0);
    origWidth = minus(origLocation(3.0), origX);
    set_param(target_block_model, 'Location', horzcat(origX, origY, plus(origX, origWidth), plus(plus(plus(origY, y), height), 30.0)));
    % 51 54
    % 52 54
    % 53 54
    close_system(save_model, 0.0);
    save_system(target_block_model, save_model);
    disp('###');
    hlink = targets_hyperlink_manager('new', 'Example Verification Process', save_model);
    % 58 59
    disp(horzcat('### Use the ', hlink, ' block(s) to verify the target block for this demo.'));
    disp('###');
end % function
