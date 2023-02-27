function ha = tightPlots(Nh, Nw, w, AR, gap, marg_h, marg_w, units)
%
% ����:
% ha = tightPlots(Nh, Nw, w, AR, gap, marg_h, marg_w, units)
%        Nh:     ��ֱ������ͼ������(��)
%        Nw:     ˮƽ������ͼ������(��)
%        w:      ���ʵ���λ��ʾ��ͼ�ο�� (see units)
%        AR:     [w h] ��ĺ��ݱ�
%        gap:    [gap] ���ʵ��ĵ�λ��ʾ����֮��ļ�϶
%                   �� [gap_h gap_w] ���ڲ�ͬ�߶ȺͿ�ȵļ�϶
%        marg_h: [mh] �ʵ���λ�ĵײ��Ͷ����߾�
%                   �� [lower upper] ���ڲ�ͬ����ҳ�߾����ҳ�߾� 
%        marg_w: [mw] �ʵ���λ�����ұ�Ե
%                   �� [left right] ���ڲ�ͬ�����ұ߾�
%        units:  Centimeters, inches, points or pixels. The function is not
%                intended to work with normalised units.
%
% ע��: 
% ���гߴ綼ת��Ϊ�����еġ��㡱��
% �����뵥λΪ�����ء�ʱ����һ����Ϊ��Ҫ����Ϊ�޷���ֽ�϶������أ�
% ������Ⱦ���õĸ��ģ�MATLAB 2014b�����߰汾Ҳ��Ҫʹ�ø�ѡ�
% ���Թ�դ��ʽ��ӡʱ���ֱ����ڱ���ʱͨ��dpi���ý��п��ƣ��μ�ʾ������
% 
% ����ͼƬ:
% ����ͼ�Σ�ʹ�ô�ӡ�����������ʾ��
%��-loose��ѡ���ȷ��ͼ�α߽���ڵ���Ϊʸ����ʽʱ���ᱻ���á�
% ����2014b�����ϰ汾��MATLAB����������Ⱦ������Ϊ��-painters����
% ��ΪĬ���������л�Ϊ��-opengl����
%
% ʾ�� 1:
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
% ʾ�� 2:
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

% �������룬��ΪĬ��ֵ
if nargin<3; w = 15; end
if nargin<4; AR = [2 1]; end
if nargin<5 || isempty(gap); gap = 0.8; end
if nargin<6 || isempty(marg_h); marg_h = [ 0.8 0.4 ]; end
if nargin<7 || isempty(marg_w); marg_w = [ 0.8 0.4 ]; end
if nargin<8; units = 'centimeters'; end
if numel(gap)==1; gap = [gap gap]; end
if numel(marg_w)==1; marg_w = [marg_w marg_w]; end
if numel(marg_h)==1; marg_h = [marg_h marg_h]; end

% ȷ���ʵ������뵥λ
if strcmp(units, 'centimeters') + strcmp(units, 'inch') + ...
        strcmp(units, 'points') + strcmp(units, 'pixels') == 0;
    error('Units must be centimeters ''inch'' ''points'' or ''pixels''');
end

% ����λ����ɵ�λ
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

% �������߿�Ⱥ͸߶�
axw = (w-sum(marg_w)-(Nw-1)*gap(2))/Nw;
axh = AR(2)/AR(1)*axw;

% ����ͼƬ�߶�
h = Nh*axh + (Nh-1)*gap(1) + sum(marg_h);

% ��ȡ��Ļ�ߴ磬��ͼ�η���������
set(0, 'units', units);
screensize = get(0, 'screensize');
figSize = [ screensize(3)/2 - w/2  screensize(4)/2 - h/2 w h];

% ����Ļ��ֽ����������ͬ��ͼ�γߴ�
set(gcf, 'Units', units, 'Resize', 'off')
set(gcf, 'Position', figSize)
set(gcf, 'PaperUnits', units, 'PaperSize', [w h])
set(gcf, 'PaperPositionMode', 'manual', 'PaperPosition', [0 0 w h])

% ��ͼ�οռ��й���������
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