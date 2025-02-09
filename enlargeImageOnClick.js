// enlarge image on click. source of the image is ./images/original/IMAGENAME.JPG
document.querySelectorAll('img').forEach(img => {
    img.addEventListener('click', () => {
        const src = img.getAttribute('src').replace('thumbnail', 'original');
        const captionText = img.getAttribute('alt');

        // オーバーレイ用コンテナを作成
        const overlay = document.createElement('div');
        overlay.style.position = 'fixed';
        overlay.style.top = '0';
        overlay.style.left = '0';
        overlay.style.right = '0';
        overlay.style.bottom = '0';
        overlay.style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
        overlay.style.zIndex = '9999';
        overlay.style.display = 'flex';
        overlay.style.flexDirection = 'column';
        overlay.style.justifyContent = 'center';
        overlay.style.alignItems = 'center';
        overlay.style.cursor = 'zoom-out';

        // 拡大画像用要素を作成
        const imgElement = document.createElement('img');
        imgElement.src = src;
        imgElement.style.maxWidth = '90%';
        imgElement.style.maxHeight = '80%';
        imgElement.style.objectFit = 'contain';

        // キャプション用要素を作成（alt属性の内容を表示）
        const caption = document.createElement('p');
        caption.textContent = captionText;
        caption.style.color = '#fff';
        caption.style.fontSize = '1.25rem';
        caption.style.marginTop = '20px';

        // オーバーレイに拡大画像とキャプションを追加
        overlay.appendChild(imgElement);
        overlay.appendChild(caption);

        // オーバーレイをクリックしたら非表示にする
        overlay.addEventListener('click', () => {
            overlay.remove();
        });

        document.body.appendChild(overlay);
    });
});