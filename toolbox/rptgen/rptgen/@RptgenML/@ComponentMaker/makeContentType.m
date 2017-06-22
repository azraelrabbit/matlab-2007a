function makeContentType(thisCM)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    fid = thisCM.openFile('getContentType.m');
    % 8 9
    fwrite(fid, sprintf('function ct=getContentType(thisComp)\n%%GETCONTENTTYPE returns the type of DocBook element the component makes\n'));
    helpStr = horzcat('%    CTYPE=H.GETCONTENTTYPE returns the type of DocBook element', char(10.0), '%    the component creates.  Possible return values are', char(10.0), '%', char(10.0), '%    * ''book'' for a book element.', char(10.0), '%    * ''section'' for chapter, sect1-5, simplesect', char(10.0), '%    * ''titlepage'' for a titlepage', char(10.0), '%    * ''paragraph'' for a paragraph', char(10.0), '%    * ''table'' for any element which can be parented by a', char(10.0), '%              section or paragraph.  Works for tables, lists,', char(10.0), '%              programlistings, etc.', char(10.0), '%    * ''text'' for CDATA, links, or any other character mix', char(10.0), '%             which can not stand alone in a section and must', char(10.0), '%             be embedded in a paragraph.', char(10.0), '%    * '''' for anything which either does not insert content into', char(10.0), '%         the report or inserts content which can live anywhere.', char(10.0), '%         (such as linking anchors or comments)', char(10.0), '%    ', char(10.0), '%    This method is heavily used by checkComponentTree to make sure', char(10.0), '%    that the component heirarchy will produce valid DocBook.', char(10.0));
    % 11 30
    % 12 30
    % 13 30
    % 14 30
    % 15 30
    % 16 30
    % 17 30
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
    % 29 30
    fwrite(fid, helpStr);
    % 31 32
    thisCM.writeHeader(fid);
    % 33 34
    fprintf(fid, 'ct='''';\n');
    % 35 36
    fclose(fid);
    % 37 38
    thisCM.viewFile('getContentType.m', 3.0);
end % function
