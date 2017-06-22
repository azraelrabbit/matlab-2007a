function cm = getContextMenu(this, selectedHandles)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent menu;
    % 6 8
    if not(isempty(this.MAObj))
        % 8 10
        if not(isempty(menu)) && ishandle(menu)
            menu.delete;
        end
        % 12 14
        me = this.MAObj.MAExplorer;
        am = DAStudio.ActionManager;
        cm = am.createPopupMenu(me);
        menuStruct = modeladvisorprivate('modeladvisorutil2', 'GetSelectMenuForTaskAdvsiorNode', this);
        runTaskAdvisorCB = am.createAction(me, 'text', menuStruct.runTaskAdvisormsg, 'callback', 'Simulink.TaskAdvisor.run;', 'enabled', menuStruct.runTaskAdvisorEnable);
        selectCB = am.createAction(me, 'text', menuStruct.selectmsg, 'callback', 'Simulink.TaskAdvisor.select;', 'enabled', menuStruct.selectEnable);
        deselectCB = am.createAction(me, 'text', menuStruct.deselectmsg, 'callback', 'Simulink.TaskAdvisor.deselect;', 'enabled', menuStruct.deselectEnable);
        cm.addMenuItem(runTaskAdvisorCB);
        cm.addSeparator;
        cm.addMenuItem(selectCB);
        cm.addMenuItem(deselectCB);
        % 24 26
        menu = cm;
    end
end
