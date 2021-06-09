function [d, p] = dijkstra(adj, s, t)
% 使用dijkstra求最短路径
% adj       输入  矩阵          邻接矩阵
% s         输入  整数          起点
% t         输入  整数 或 []    终点
% d         输出  向量          路径长度，若t==[]，则返回从起点到所有节点的路径长度
% p         输出  向量 或 元胞   路径，若t==[]，则返回从起点到所有节点的路径(cell)
nodes_num = size(adj, 1);
dist = inf(nodes_num, 1);
previous = inf(nodes_num, 1);
Q = [1:nodes_num]';
 
% 求邻居
neighbors = cell(nodes_num, 1);
for i = 1:nodes_num; neighbors{i} = find(adj(i, :) > 0); end
 
dist(s) = 0;
while ~isempty(Q)
    % 取出距离最小点
    [~, min_ind] = min(dist(Q));
    min_node = Q(min_ind);
    Q = setdiff(Q, min_node);
 
    % 若是终点，则结束程序
    if min_node == t
        d = dist(min_node);
        p = generate_path(previous, t);
        return;
    end
 
    % 更新邻居的距离
    for i = 1:length(neighbors{min_node})
        neighbor = neighbors{min_node}(i);
        alt = dist(min_node) + adj(min_node, neighbor);
        if alt < dist(neighbor)
            dist(neighbor) = alt;
            previous(neighbor) = min_node;
        end
    end 
end
d = dist;
p = cell(nodes_num, 1);
for i = 1:nodes_num; p{i} = generate_path(previous, i); end
end
 
% 由前趋推出路径
function path = generate_path(previous, t)
path = [t];
while previous(t) <= length(previous)
    path = [previous(t) path];
    t = previous(t);
end
end