document.addEventListener('DOMContentLoaded', () => {
  const fileInput = document.getElementById('fileInput');

  if (!fileInput) return; // fileInputが存在しない場合は終了

  const createImageHTML = (blob) => {
    const imagePreview = document.getElementById('image-preview');
    const blobImage = document.createElement('img');
    blobImage.setAttribute('class', 'new-img');
    blobImage.setAttribute('src', blob);

    imagePreview.appendChild(blobImage);
  };

  fileInput.addEventListener('change', (e) => {
    const imagePreview = document.getElementById('image-preview');

    // 既存のプレビュー画像をすべて削除
    while (imagePreview.firstChild) {
      imagePreview.removeChild(imagePreview.firstChild);
    }

    // 選択されたファイルごとに画像を生成
    Array.from(e.target.files).forEach(file => {
      const blob = window.URL.createObjectURL(file);
      createImageHTML(blob);
    });
  });
});
