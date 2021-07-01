# Wound Size Measurement
 
   對於wound的偵測分割，使用的方法是region growing的方法作測試，而我套用的function是 Dirk-Jan Kroon 所提供的version 1.0.0.0，網址為 : https://www.mathworks.com/matlabcentral/fileexchange/19084-region-growing。

   針對此function進行更改後，操作方式為滑鼠指標可以讓使用者自由選擇想要進行偵測分割的位置點，region growing演算法就會計算此點附近周圍灰階值接近的點為一個區域(region)，而灰階值接近的標準是可以自己做設定的，程式碼裡的變數為 ”reg_maxdist”。
   
   而wound size的判斷，在這裡我是計算分割出的區域pixels數量作判斷，再由區域pixels數量去除整張圖的整體pixels數量，進而得到wound佔整體影像上的比值，如此一來才可針對一般JPG影像和IR影像的wound偵測比較。
 
![image](https://user-images.githubusercontent.com/73085151/122198148-787be300-cecb-11eb-8aa6-bff2a7aee425.png)

操作示意圖(圖一)


## 1.	針對JPG影像
叉叉圖案為滑鼠指標所點位置，白色區域為傷口偵測的區域。
    
![image](https://user-images.githubusercontent.com/73085151/122198180-829de180-cecb-11eb-8516-dc7e321f52ee.png)

JPG影像偵測結果(圖二)


## 2.	針對IR影像

如果直接將原本IR影像去作region growing的效果非常的差，所以必須作前處理，才能將傷口分割出來。
    
![image](https://user-images.githubusercontent.com/73085151/122198406-b7aa3400-cecb-11eb-8d3c-da3e1a0d1937.png) 

原IR影像偵測結果(圖三)，右側為傷口偵測區域


前處理的方式我是將IR影像的灰階度變化範圍擴大，讓黑的地方更黑，白的地方更白，藉此凸顯傷口的特徵；再進行負片的效果，更易觀察到傷口的位置範圍。

![image](https://user-images.githubusercontent.com/73085151/122198479-c5f85000-cecb-11eb-8a34-1cff10ed34e6.png)

IR影像偵測結果(圖四)
