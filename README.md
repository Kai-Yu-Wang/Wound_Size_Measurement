# Wound_Size_Measurement
 
![image](https://user-images.githubusercontent.com/73085151/122198148-787be300-cecb-11eb-8aa6-bff2a7aee425.png)
操作示意圖(圖一)
1.	針對JPG影像
    叉叉圖案為滑鼠指標所點位置，白色區域為傷口偵測的區域。
![image](https://user-images.githubusercontent.com/73085151/122198180-829de180-cecb-11eb-8516-dc7e321f52ee.png)
JPG影像偵測結果(圖二)

![image](https://user-images.githubusercontent.com/73085151/122198217-8af61c80-cecb-11eb-89c2-ba71f6a3c516.png)
wound size比值(表一)

2.	針對IR影像

    如果直接將原本IR影像去作region growing的效果非常的差，所以必須作前處理，才能將傷口分割出來。
 
原IR影像偵測結果(圖三)，右側為傷口偵測區域

    前處理的方式我是將IR影像的灰階度變化範圍擴大，讓黑的地方更黑，白的地方更白，藉此凸顯傷口的特徵；再進行負片的效果，更易觀察到傷口的位置範圍。
