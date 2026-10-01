import os
from PIL import Image, ImageOps

brain_dir = r"C:\Users\user\.gemini\antigravity-ide\brain\aa7929db-339c-486f-be6f-86ef20e01fe5\.user_uploaded"
veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"

ev_user_logos = {
    'ola_scooter.webp': 'media_1790770900515.png',
    'ather.webp': 'media_1790770937572.png',
    'hero_vida.webp': 'media_1790770962677.png',
    'bajaj_chetak.webp': 'media_1790771004479.png',
    'other_ev.webp': 'media_1790771044716.png',
}

def process_user_logo(src_path, dest_path, target_size=(512, 512), padding=40):
    img = Image.open(src_path).convert('RGBA')
    
    # Trim transparent or pure white borders
    datas = img.getdata()
    new_data = []
    for item in datas:
        # If pixel is near white
        if item[0] > 248 and item[1] > 248 and item[2] > 248:
            new_data.append((255, 255, 255, 0))
        else:
            new_data.append(item)
    img.putdata(new_data)
    
    bbox = img.getbbox()
    if bbox:
        img = img.crop(bbox)
        
    w, h = img.size
    max_w = target_size[0] - (padding * 2)
    max_h = target_size[1] - (padding * 2)
    
    scale = min(max_w / w, max_h / h)
    new_w = max(1, int(w * scale))
    new_h = max(1, int(h * scale))
    
    img_resized = img.resize((new_w, new_h), Image.Resampling.LANCZOS)
    
    # White background canvas with crisp layout
    canvas = Image.new('RGBA', target_size, (255, 255, 255, 255))
    paste_x = (target_size[0] - new_w) // 2
    paste_y = (target_size[1] - new_h) // 2
    
    canvas.paste(img_resized, (paste_x, paste_y), img_resized)
    
    os.makedirs(os.path.dirname(dest_path), exist_ok=True)
    canvas.convert('RGB').save(dest_path, 'WEBP', quality=96)
    print(f"-> SUCCESS: Processed user EV logo {os.path.basename(dest_path)} ({os.path.getsize(dest_path)} bytes)")

print("=== Processing User-Uploaded EV Brand Logos ===")
for dest_name, src_name in ev_user_logos.items():
    src = os.path.join(brain_dir, src_name)
    dest = os.path.join(veh_dir, dest_name)
    if os.path.exists(src):
        process_user_logo(src, dest)
    else:
        print(f"Missing file: {src}")

print("\nAll 5 EV Brand Logos updated from user uploads!")
