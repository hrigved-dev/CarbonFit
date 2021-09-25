import bs4
import csv

from urllib.request import HTTPRedirectHandler, urlopen as uReq,Request
from bs4 import BeautifulSoup as soup

filename="UNScrape.csv"
with open(filename,'w',encoding="utf-8") as f:
    headers=["Name","Id","Brief","Min","Availability","Link"]
    thewriter=csv.DictWriter(f,fieldnames=headers)
    thewriter.writeheader()

    my_url="https://offset.climateneutralnow.org/AllProjects?ContinentId=261&CountryId=335"
    hdr = {'User-Agent': 'Mozilla/5.0'}
    req = Request(my_url,headers=hdr)
    uClient= uReq(req)
    page_html=uClient.read()
    uClient.close()

    page_soup=soup(page_html,"html.parser")
    class_items_div=page_soup.find_all("div",{"class":"core-info"})
    length=len(class_items_div)
    for i in range (0,length):
        name=class_items_div[i].find("h3").text #Name 
        avail=str(class_items_div[i].findAll("span")[1].text).replace(",","")
        avail_int= [int(m) for m in avail.split() if m.isdigit()][0] # available in tonnes
        id=str(class_items_div[i].h4.text)
        min=str(class_items_div[i].findAll("span")[0].text)[5:]
        brief=str(page_soup.findAll("div",{"class","description"})[i].text)
        #do link manually if not possible 

        thewriter.writerow({"Name":name,"Id":id,"Brief":brief,"Min":min,"Availability":avail_int})


    my_url="https://offset.climateneutralnow.org/AllProjects?ContinentId=261&CountryId=335&PageNumber=2"
    hdr = {'User-Agent': 'Mozilla/5.0'}
    req = Request(my_url,headers=hdr)
    uClient= uReq(req)
    page_html=uClient.read()
    uClient.close()

    page_soup=soup(page_html,"html.parser")
    class_items_div=page_soup.find_all("div",{"class":"core-info"})
    length=len(class_items_div)
    for i in range (0,length):
        name=class_items_div[i].find("h3").text #Name 
        avail=str(class_items_div[i].findAll("span")[1].text).replace(",","")
        avail_int= [int(m) for m in avail.split() if m.isdigit()][0] # available in tonnes
        id=str(class_items_div[i].h4.text)
        min=str(class_items_div[i].findAll("span")[0].text)[5:]
        brief=str(page_soup.findAll("div",{"class","description"})[i].text)
        #do link manually if not possible 

        thewriter.writerow({"Name":name,"Id":id,"Brief":brief,"Min":min,"Availability":avail_int})
f.close()