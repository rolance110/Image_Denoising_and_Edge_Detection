# Image_Denoising_and_Edge_Detection
基於硬體架構實現二值圖像降噪與邊緣偵測 \
Hardware-Based Implementation of Binary Image Denoising and Edge Detection 
## 摘要 
在近年來由於無人駕駛興起使得圖像處理越來越重要，而圖像預處理演算法的好壞直接關係到後續圖像處理的效果，如圖像分割、目標識別、邊緣提取等，為了能讀取到鮮明的圖像，很多時候都需要對圖像進行降噪處理，盡可能的保完整又能夠去除圖像中雜訊。圖像降噪最常見的應用就在於處理即將被識別的物體，像是能夠使驗證碼識別更加準確。
在本篇小專題中，我先對二值圖像利用距離變換演算法(Distance Transform)進行圖像降噪，再對圖像利用卷積(convolution)進行邊緣偵測。相較於其他較易實現的二值圖像降噪的方法不同，我使用的方式能對干擾較嚴重的圖像進行較完整的降噪同時加深主要特徵。
我在本篇小專題中加入了管線化( Pipeline )的設計，使得在對多張圖像處理時能更加快速。
完成的電路在時序為3.5 ns、TSMC 0.13um 製程的環境下使用compile_ultra與compile_ultra -incremental 指令進行合成。電路面積為18311.5511 um2 、合成後時間為3530941.75 ns，電路的功能在跑gate-level模擬後結果如預期能對輸入的二值圖像進行圖像降噪並實施邊緣偵測。

關鍵字：二值圖像處理、圖像降噪、距離變換、圖像卷積、Pipeline、TSMC 0.13 um 製程
## 圖像變化
![image](https://github.com/rolance110/Image_Denoising_and_Edge_Detection/assets/127593514/46385c40-def7-44cc-b221-ca0e36ec85d2)
## 結論
在這個小專題中實作出了一個二值化圖像降噪結合邊緣偵測的電路，並利用管線化( pipeline )的方式讓電路能夠同時處理多張圖片。尋找題目的過程中，我學習到許多關於影像處理與圖像修復的知識，在後續撰寫測試檔時由於平常在相關課程上比較沒有重點強調這部分，在寫的過程中我利用網路資源學習到許多相關語法，像是讀取與寫入圖片的方式。
在實作小專題的過程間，我有報名TSRI台灣半導體研究中心的教育課程，其中教學了許多 Verdi 與Design Compile 的知識，我藉這次小專題熟習課堂上學習到的相關知識，透過上課與實作的方式讓我對於使用EDA工具進行除錯與合成有了更進一步的了解。
完成的電路在時序為3.5 ns、TSMC 0.13 um 製程的環境下使用compile_ultra與compile_ultra -incremental 指令進行合成。電路面積為18311.5511 um2 、合成後的執行時間為3530941.75 ns 。
由結果展示來看，小專題實現的電路確實能夠將多張有受到干擾的圖像進行降噪並執行邊緣偵測。

