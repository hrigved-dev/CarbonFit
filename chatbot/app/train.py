import json
import numpy as np
from numpy.lib.index_tricks import _ix__dispatcher
import torch 
import torch.nn as nn 
from torch.utils.data import Dataset,DataLoader
from nltk_utils import stem,tokenize,bag_of_words
from model import NeuralNet

with open('intents.json','r')as f:
    intents=json.load(f)

all_words=[]
tags=[]
xy=[]
for intent in intents['intents']:
    tag=intent['tag']
    tags.append(tag) 
    for pattern in intent['patterns']: 
        w=tokenize(pattern)
        all_words.extend(w)
        xy.append((w,tag))

ignore_words=["?","!",".",","]
all_words=[stem(w) for w in all_words if w not in ignore_words]
all_words=sorted(set(all_words))
tags=sorted(set(tags))

X_train=[]
Y_train=[]

for (pattern_sentence, tag) in xy:
    bag=bag_of_words(pattern_sentence,all_words)
    X_train.append(bag)
    label = tags.index(tag)
    Y_train.append(label)

X_train=np.array(X_train)
Y_train=np.array(Y_train)


class ChatDataset(Dataset):
    def __init__(self):
        self.n_samples=len(X_train)
        self.x_data=X_train
        self.y_data=Y_train
    # dataset[idx]
    def __getitem__(self, idx):
        return self.x_data[idx], self.y_data[idx] 

    def __len__(self):
        return self.n_samples
    
#hyper params 
batch_size=8
hidden_size=8
output_size=len(tags)
input_size=len(all_words)
learning_rate=0.001
num_epochs=1000

dataset=ChatDataset()
if __name__ == '__main__':
    
    train_loader=DataLoader(dataset=dataset, batch_size=batch_size, shuffle=True,num_workers=1)

    device=torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    model= NeuralNet(input_size,hidden_size,output_size).to(device)

    criterion=nn.CrossEntropyLoss()
    optimizer=torch.optim.Adam(model.parameters(),lr=learning_rate)

    for epoch in range(num_epochs):
        for (words, labels) in train_loader:
            words=words.to(device)
            labels=labels.to(dtype=torch.long)
            labels=labels.to(device)

            #forward
            outputs=model(words)
            loss=criterion(outputs,labels)

            #backward and optimmizer step
            optimizer.zero_grad()
            loss.backward()
            optimizer.step()

        if(epoch +1)%100==0:
            print(f'epoch {(epoch+1)/num_epochs}, loss={loss.item():.4f}')


    print(f'final loss, loss={loss.item():.4f}')

    data={
        "model_state":model.state_dict(),
        "input_size":input_size,
        "output_size":output_size,
        "hidden_size":hidden_size,
        "all_words":all_words,
        "tags":tags
    } 

    FILE="data.pth"
    torch.save(data,FILE)
    print(f'training complete. file saved to {FILE}')