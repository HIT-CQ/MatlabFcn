function ha = tightPlots(Nh, Nw, w, AR, gap, marg_h, marg_w, units)
%
% 输入:
% ha = tightPlots(Nh, Nw, w, AR, gap, marg_h, marg_w, units)
%        Nh:     垂直方向子图的数量(行)
%        Nw:     水平方向子图的数量(列)
%        w:      以适当单位表示的图形宽度 (see units)
%        AR:     [w h] 轴的横纵比
%        gap:    [gap] 以适当的单位表示的轴之间的间隙
%                   或 [gap_h gap_w] 用于不同高度和宽度的间隙
%        marg_h: [mh] 适当单位的底部和顶部边距
%                   或 [lower upper] 用于不同的下页边距和上页边距 
%        marg_w: [mw] 适当单位的左右边缘
%                   或 [left right] 用于不同的左右边距
%        units:  Centimeters, inches, points or pixels. The function is not
%                intended to work with normalised units.
%
% 注意: 
% 所有尺寸都转换为函数中的“点”。
% 当输入单位为“像素”时，这一点尤为必要，因为无法在纸上定义像素！
% 随着渲染设置的更改，MATLAB 2014b及更高版本也需要使用该选项。
% 当以光栅格式打印时，分辨率在保存时通过dpi设置进行控制（参见示例）。
% 
% 保存图片:
% 保存图形，使用打印命令，如下例所示。
%“-loose”选项可确保图形边界框在导出为矢量格式时不会被剪裁。
% 对于2014b及以上版本的MATLAB，勿忘将渲染器设置为“-painters”，
% 因为默认设置已切换为“-opengl”。
%
% 示例 1:
%   ha = tightPlots(2, 2, 15, [2 1], [0.4 0.4], [0.6 0.7], [0.8 0.3], 'centimeters');
%   f = [1 5 10 15]; x = 0:0.05:10;
%   for i = 1:length(f)
%       y = sin(f(i) * x);
%       axes(ha(i)); plot(x, y)
%   end
%   set(ha(1:4), 'fontname', 'Times', 'fontsize', 10)
%   set(ha(1:2), 'xticklabel', '');
%   set([ha(2) ha(4)], 'yticklabel', '');
%   axes(ha(1));  title('Title 1');
%   axes(ha(2));  title('Title 2');
%
%   print(gcf, 'Example1.png', '-dpng', '-r200', '-opengl');
%   print(gcf, 'Example1.eps', '-depsc2', '-painters', '-loose');
%   print(gcf, 'Example1.pdf', '-dpdf', '-painters', '-loose');
% 
% 示例 2:
%   ha = tightPlots(1, 2, 15, [1 1], 0.25, 0.25, 0.25, 'centimeters');
%   f = [1 5]; x = 0:0.05:10;
%   for i = 1:length(f)
%       y = sin(f(i) * x);
%       axes(ha(i)); plot(x, y)
%   end
%   set(ha(1:2), 'XtickLabel', '', 'YtickLabel', '')
%
%   print(gcf, 'Example2.png', '-dpng', '-r200', '-opengl');
%   print(gcf, 'Example2.eps', '-depsc2', '-painters', '-loose');
%   print(gcf, 'Example2.pdf', '-dpdf', '-painters', '-loose');
% -------------------------------------------------------------------------

% 若无输入，则为默认值
if nargin<3; w = 15; end
if nargin<4; AR = [2 1]; end
if nargin<5 || isempty(gap); gap = 0.8; end
if nargin<6 || isempty(marg_h); marg_h = [ 0.8 0.4 ]; end
if nargin<7 || isempty(marg_w); marg_w = [ 0.8 0.4 ]; end
if nargin<8; units = 'centimeters'; end
if numel(gap)==1; gap = [gap gap]; end
if numel(marg_w)==1; marg_w = [marg_w marg_w]; end
if numel(marg_h)==1; marg_h = [marg_h marg_h]; end

% 确保适当的输入单位
if strcmp(units, 'centimeters') + strcmp(units, 'inch') + ...
        strcmp(units, 'points') + strcmp(units, 'pixels') == 0;
    error('Units must be centimeters ''inch'' ''points'' or ''pixels''');
end

% 将单位换算成点位
if strcmp(units, 'centimeters') == 1; 
    con = 72/2.54;
elseif strcmp(units, 'inch') == 1
    con = 72;
elseif strcmp(units, 'pixels') == 1
    con = 0.75;
else
    con = 1;
end

units = 'points';
w = w * con;
gap = gap * con;
marg_h = marg_h * con;
marg_w = marg_w * con;

% 计算轴线宽度和高度
axw = (w-sum(marg_w)-(Nw-1)*gap(2))/Nw;
axh = AR(2)/AR(1)*axw;

% 计算图片高度
h = Nh*axh + (Nh-1)*gap(1) + sum(marg_h);

% 获取屏幕尺寸，将图形放置在中心
set(0, 'units', units);
screensize = get(0, 'screensize');
figSize = [ screensize(3)/2 - w/2  screensize(4)/2 - h/2 w h];

% 在屏幕和纸张上设置相同的图形尺寸
set(gcf, 'Units', units, 'Resize', 'off')
set(gcf, 'Position', figSize)
set(gcf, 'PaperUnits', units, 'PaperSize', [w h])
set(gcf, 'PaperPositionMode', 'manual', 'PaperPosition', [0 0 w h])

% 在图形空间中构建坐标轴
py = h-marg_h(2)-axh; 

ha = zeros(Nh*Nw,1);
ii = 0;
for ih = 1:Nh
    px = marg_w(1);
    
    for ix = 1:Nw
        ii = ii+1;
        
        ha(ii) = axes;
        set(gca, 'Units', units, 'Position', [px py axw axh])
        set(gca, 'XTickLabel', '', 'YTickLabel', '')
        
        px = px+axw+gap(2);
    end
    
    py = py-axh-gap(1);
end

end