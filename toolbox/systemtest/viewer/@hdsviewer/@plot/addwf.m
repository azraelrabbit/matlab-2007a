function wf = addwf(this, DataSrc)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    wf = hdsviewer.dataview;
    wf.Parent = this;
    wf.DataSrc = DataSrc;
    % 14 18
    % 15 18
    % 16 18
    localinitialize(wf);
    % 18 30
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    this.Waves = vertcat(horzcat(this.Waves), wf);
    % 30 33
    % 31 33
    this.refreshLegends;
function localinitialize(this)
    % 34 38
    % 35 38
    % 36 38
    [this.Data, this.View, DataProps] = createdataview(this.Parent);
    % 38 41
    % 39 41
    this.SelectionListener = handle.listener(this.View, 'Selection', cellhorzcat(@localSelection, this));
    % 41 47
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    this.addlisteners;
    this.addlisteners(vertcat(handle.listener(this, this.findprop('Visible'), 'PropertyPostSet', @LocalVisible), handle.listener(this.View, this.View(1.0).findprop('Visible'), 'PropertyPostSet', @LocalViewVisible)));
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    refresh(this)
function LocalVisible(this, eventdata)
    % 56 66
    % 57 66
    % 58 66
    % 59 66
    % 60 66
    % 61 66
    % 62 66
    % 63 66
    % 64 66
    refresh(this)
    % 66 68
    if isvisible(this)
        draw(this)
    else
        this.Parent.AxesGrid.send('ViewChanged');
    end % if
function LocalViewVisible(this, eventdata)
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    View = eventdata.AffectedObject;
    ViewVis = strcmp(View.Visible, 'on');
    if ViewVis
        Mask = refreshmask(this);
    else
        Mask = false;
    end % if
    % 85 87
    View.refresh(Mask);
    % 87 90
    % 88 90
    if ViewVis && isvisible(this)
        draw(this)
    else
        this.Parent.AxesGrid.send('ViewChanged');
    end % if
function localSelection(es, ed, this)
    % 95 100
    % 96 100
    % 97 100
    % 98 100
    this.datasrc.FilterControl.selectedgridpoint = ed.GridPoint;
