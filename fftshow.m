function fftshow(f,type)
% Example:
% c=imread('cameraman.tif');
% cf=fftshift(fft2(c));
% fftshow(cf,'abs')
%
if nargin<2
    type='log';
end
if (type=='log')
    fl = log(1+abs(f));
    fm = max(fl(:));
    imshow(im2uint8(fl/fm))
elseif (type=='abs')
    fa=abs(f);
    fm=max(fa(:));
    imshow(fa/fm)
else
    error('TYPE must be abs or log.');
end