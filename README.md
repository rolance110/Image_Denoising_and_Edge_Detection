# Image_Denoising_and_Edge_Detection
基於硬體架構實現二值圖像降噪與邊緣偵測 \
Hardware-Based Implementation of Binary Image Denoising and Edge Detection \
在近年來由於無人駕駛興起使得圖像處理越來越重要，而圖像預處理演算法的好壞直接關係到後續圖像處理的效果，如圖像分割、目標識別、邊緣提取等，為了能讀取到鮮明的圖像，很多時候都需要對圖像進行降噪處理，盡可能的保完整又能夠去除圖像中雜訊。圖像降噪最常見的應用就在於處理即將被識別的物體，像是能夠使驗證碼識別更加準確。
在本篇小專題中，我先對二值圖像利用距離變換演算法(Distance Transform)進行圖像降噪，再對圖像利用卷積(convolution)進行邊緣偵測。相較於其他較易實現的二值圖像降噪的方法不同，我使用的方式能對干擾較嚴重的圖像進行較完整的降噪同時加深主要特徵。
我在本篇小專題中加入了管線化( Pipeline )的設計，使得在對多張圖像處理時能更加快速。
完成的電路在時序為3.5 ns、TSMC 0.13um 製程的環境下使用compile_ultra與compile_ultra -incremental 指令進行合成。電路面積為18311.5511 um2 、合成後時間為3530941.75 ns，電路的功能在跑gate-level模擬後結果如預期能對輸入的二值圖像進行圖像降噪並實施邊緣偵測。

關鍵字：二值圖像處理、圖像降噪、距離變換、圖像卷積、Pipeline、
TSMC 0.13 um 製程

