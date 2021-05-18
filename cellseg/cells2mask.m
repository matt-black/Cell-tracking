function [ mask ] = cells2mask ( cells, img_size )
%CELLS2MASK convert list of cells to a mask for image of size `img_size`
    if nargin < 2
        img_size = [768 1024];
    end
    mask = false (img_size);
    % object for converting x/y to r/c
    rconv = imref2d (img_size, [0 img_size(2)-1], [0 img_size(1)-1]);
    % loop through cells, convert each
    for ic = 1:numel(cells)
        [row, col] = worldToSubscript (rconv, cells(ic).pix(:,1), ...
                                       cells(ic).pix(:,2));
        % convert r/c to linear index to assign
        ind = sub2ind (img_size, row, col);
        mask(ind) = true;
    end
end