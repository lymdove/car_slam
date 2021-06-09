import numpy as np

import point

obstacle_list1 = [[2, 2], [10, 3], [3, 24], [20, 3], [30, 25], [40, 20], [38, 37]]
obstacle_list2 = [[10, 16], [19, 20], [7, 10]]


class RandomMap:
    def __init__(self, size=50):
        self.size = size
        self.obstacle = size//4
        self.obstacle_size = [[5, 6], [9, 3]]
        self.GenerateObstacle()

    def GenerateObstacle(self):
        self.obstacle_point = []
        for n in obstacle_list1:
            for i in range(self.obstacle_size[0][0]):
                for j in range(self.obstacle_size[0][1]):
                    self.obstacle_point.append(point.Point(n[0] + i, n[1] + j))

        for n in obstacle_list2:
            for i in range(self.obstacle_size[1][0]):
                for j in range(self.obstacle_size[1][1]):
                    self.obstacle_point.append(point.Point(n[0] + i, n[1] + j))
    # def GenerateObstacle(self):
    #     self.obstacle_point = []
    #     self.obstacle_point.append(point.Point(self.size//2, self.size//2))
    #     self.obstacle_point.append(point.Point(self.size//2, self.size//2-1))

    #     # Generate an obstacle in the middle
    #     for i in range(self.size//2-4, self.size//2):
    #         self.obstacle_point.append(point.Point(i, self.size-i))
    #         self.obstacle_point.append(point.Point(i, self.size-i-1))
    #         self.obstacle_point.append(point.Point(self.size-i, i))
    #         self.obstacle_point.append(point.Point(self.size-i, i-1))

    #     for i in range(self.obstacle-1):
    #         x = np.random.randint(0, self.size)
    #         y = np.random.randint(0, self.size)
    #         self.obstacle_point.append(point.Point(x, y))

    #         if (np.random.rand() > 0.5): # Random boolean
    #             for l in range(self.size//4):
    #                 self.obstacle_point.append(point.Point(x, y+l))
    #                 pass
    #         else:
    #             for l in range(self.size//4):
    #                 self.obstacle_point.append(point.Point(x+l, y))
    #                 pass

    def IsObstacle(self, i ,j):
        for p in self.obstacle_point:
            if i==p.x and j==p.y:
                return True
        return False