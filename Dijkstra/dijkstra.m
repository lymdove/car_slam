function [d, p] = dijkstra(adj, s, t)
% ʹ��dijkstra�����·��
% adj       ����  ����          �ڽӾ���
% s         ����  ����          ���
% t         ����  ���� �� []    �յ�
% d         ���  ����          ·�����ȣ���t==[]���򷵻ش���㵽���нڵ��·������
% p         ���  ���� �� Ԫ��   ·������t==[]���򷵻ش���㵽���нڵ��·��(cell)
nodes_num = size(adj, 1);
dist = inf(nodes_num, 1);
previous = inf(nodes_num, 1);
Q = [1:nodes_num]';
 
% ���ھ�
neighbors = cell(nodes_num, 1);
for i = 1:nodes_num; neighbors{i} = find(adj(i, :) > 0); end
 
dist(s) = 0;
while ~isempty(Q)
    % ȡ��������С��
    [~, min_ind] = min(dist(Q));
    min_node = Q(min_ind);
    Q = setdiff(Q, min_node);
 
    % �����յ㣬���������
    if min_node == t
        d = dist(min_node);
        p = generate_path(previous, t);
        return;
    end
 
    % �����ھӵľ���
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
 
% ��ǰ���Ƴ�·��
function path = generate_path(previous, t)
path = [t];
while previous(t) <= length(previous)
    path = [previous(t) path];
    t = previous(t);
end
end