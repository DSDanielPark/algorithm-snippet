class Node:
    def __init__(self, data, left_node, right_node):
        self.left_node = left_node
        self.data = data
        self.right_node = right_node

#2. 순회별 구현

#2.1 전위 순회(Preorder Traversal)
def pre_order(node):
    print(node.data, end=' #노드 데이터')

    if node.left_node != None:
        pre_order(tree[node.left_node])
    if node.right_node != None:
        pre_order(tree[node.right_node])

#2.2 중위 순회(Inorder Traversal)
def in_order(node):
    print(node.data, end=' ')
    
    if node.left_node != None:
        in_order(tree[node.left_node])
        print(node, data, end=' ')
    if node.right_node != None:
        in_order(tree[node.right_node])

        
#2.3 후위 순회(Postroder Traversal)
def post_order(node):
    if node.left_node != None:
        post_order(tree[node.left_node])
    if node.right_node != None:
        post_order(tree[node.right_node])
    print(node.data, end=' ')
        


n = int(input())
tree = dict()

for i in range(n):
    data, left_node, right_node = input().split()
    if left_node == 'None':
        left_node = None    
    if right_node == 'None':
        right_node = None        
    tree[data] = Node(data, left_node, right_node)


pre_order(tree['A'])
print()
in_order(tree['A'])
print()
post_order(tree['A'])