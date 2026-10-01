import os
import io
import time
import urllib.request
import urllib.parse
import json
from PIL import Image, ImageDraw, ImageFont, ImageFilter, ImageEnhance

HEADERS = {'User-Agent': 'VoltSpareShowcase/1.0 (contact@voltspare.in)'}

def get_wikimedia_thumb(title, width=1280):
    url = f"https://commons.wikimedia.org/w/api.php?action=query&format=json&titles={urllib.parse.quote(title)}&prop=imageinfo&iiprop=url&iiurlwidth={width}"
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode())
            pages = data.get('query', {}).get('pages', {})
            for p in pages.values():
                info = p.get('imageinfo', [{}])[0]
                return info.get('thumburl') or info.get('url')
    except Exception as e:
        print(f"Error {title}: {e}")
        return None

def download_img(url):
    if not url:
        return None
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=20) as resp:
            return Image.open(io.BytesIO(resp.read())).convert('RGBA')
    except Exception as e:
        print(f"Failed {url}: {e}")
        return None

def create_showcase_card(veh_img, logo_img, output_path, target_size=(512, 512)):
    # 1. Base Vehicle Photo - Center Crop to 512x512 with slight contrast boost
    w, h = veh_img.size
    min_dim = min(w, h)
    left = (w - min_dim) // 2
    top = (h - min_dim) // 2
    veh_cropped = veh_img.crop((left, top, left + min_dim, top + min_dim))
    veh_resized = veh_cropped.resize(target_size, Image.Resampling.LANCZOS)
    
    enhancer = ImageEnhance.Contrast(veh_resized.convert('RGB'))
    veh_enhanced = enhancer.enhance(1.05).convert('RGBA')
    color_enhancer = ImageEnhance.Color(veh_enhanced.convert('RGB'))
    veh_enhanced = color_enhancer.enhance(1.08).convert('RGBA')
    
    # 2. Add subtle dark gradient overlay at top-left for logo badge readability
    overlay = Image.new('RGBA', target_size, (0, 0, 0, 0))
    d_overlay = ImageDraw.Draw(overlay)
    
    # Gradient in top area
    for y in range(160):
        alpha = int(90 * (1.0 - (y / 160.0)))
        d_overlay.line([(0, y), (target_size[0], y)], fill=(0, 0, 0, alpha))
        
    final_card = Image.alpha_composite(veh_enhanced, overlay)
    
    # 3. Logo Badge Pill Overlay in Top-Left Corner
    if logo_img:
        # Clean logo pixels
        datas = logo_img.getdata()
        new_data = []
        for item in datas:
            if item[0] > 240 and item[1] > 240 and item[2] > 240:
                new_data.append((255, 255, 255, 0))
            else:
                new_data.append(item)
        logo_img.putdata(new_data)
        
        bbox = logo_img.getbbox()
        if bbox:
            logo_img = logo_img.crop(bbox)
            
        lw, lh = logo_img.size
        badge_w, badge_h = 160, 56
        max_lw, max_lh = badge_w - 24, badge_h - 16
        
        scale = min(max_lw / lw, max_lh / lh)
        new_lw = max(1, int(lw * scale))
        new_lh = max(1, int(lh * scale))
        
        logo_resized = logo_img.resize((new_lw, new_lh), Image.Resampling.LANCZOS)
        
        # Draw Glassmorphic / White Pill Badge
        badge = Image.new('RGBA', (badge_w, badge_h), (255, 255, 255, 0))
        d_badge = ImageDraw.Draw(badge)
        
        # White pill with subtle shadow
        d_badge.rounded_rectangle([0, 0, badge_w, badge_h], radius=16, fill=(255, 255, 255, 245), outline=(226, 232, 240, 255), width=2)
        
        # Paste logo inside badge
        paste_lx = (badge_w - new_lw) // 2
        paste_ly = (badge_h - new_lh) // 2
        badge.paste(logo_resized, (paste_lx, paste_ly), logo_resized)
        
        # Paste Badge onto final card at top-left (margin 20, 20)
        final_card.paste(badge, (20, 20), badge)
        
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    final_card.convert('RGB').save(output_path, 'WEBP', quality=94)
    print(f"-> SUCCESS: Saved Showcase Card {output_path} ({os.path.getsize(output_path)} bytes)")

# Vehicle Photos and Official Logo Pairs
models_data = [
    {
        'filename': 'ola_scooter.webp',
        'veh_wiki': 'File:Orange colour OLA Electric scooter.jpg',
        'logo_wiki': 'File:OLA_Electric_logo.svg'
    },
    {
        'filename': 'ather.webp',
        'veh_wiki': 'File:Orange colour OLA Electric scooter.jpg',
        'logo_wiki': 'File:Ather-logo.svg'
    },
    {
        'filename': 'hero_vida.webp',
        'veh_wiki': 'File:Black OLA Electric scooters.jpg',
        'logo_wiki': 'File:Hero_VIDA_new_logo.png'
    },
    {
        'filename': 'bajaj_chetak.webp',
        'veh_wiki': 'File:Bajaj_Chetak_150.JPG',
        'logo_wiki': 'File:Bajaj_Chetak_logo.jpg'
    },
    {
        'filename': 'other_ev.webp',
        'veh_wiki': 'File:Black OLA Electric scooters.jpg',
        'logo_wiki': 'File:Move_(electric_vehicle_charging)_logo.svg'
    },
    {
        'filename': 'hero_motocorp.webp',
        'veh_wiki': 'File:Hero_Honda_Passion.jpg',
        'logo_wiki': 'File:Hero_MotoCorp.svg'
    },
    {
        'filename': 'honda_two_wheeler.webp',
        'veh_wiki': 'File:Gold_Metallic_Honda_Activa.jpg',
        'logo_wiki': 'File:Honda_Logo.svg'
    },
    {
        'filename': 'bajaj_auto.webp',
        'veh_wiki': 'File:Bajaj_Pulsar_200_NS.jpg',
        'logo_wiki': 'File:Bajaj_Auto_Ltd_logo.svg'
    },
    {
        'filename': 'tvs_motor.webp',
        'veh_wiki': 'File:Apache_rtr_310.jpg',
        'logo_wiki': 'File:TVS_logo.svg'
    },
    {
        'filename': 'yamaha.webp',
        'veh_wiki': 'File:Yamaha_R15_V3.0.jpg',
        'logo_wiki': 'File:Yamaha_Motor_logo.svg'
    },
    {
        'filename': 'royal_enfield.webp',
        'veh_wiki': 'File:Royal_Enfield_Classic_350_(2017_Model_Year).jpg',
        'logo_wiki': 'File:Royal_Enfield_logo.svg'
    },
]

veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"

print("=== Generating 3D Vehicle Showcase Cards with Brand Logo Badge Overlays ===")
for item in models_data:
    v_url = get_wikimedia_thumb(item['veh_wiki'], width=1280)
    l_url = get_wikimedia_thumb(item['logo_wiki'], width=1280)
    
    v_img = download_img(v_url)
    l_img = download_img(l_url)
    
    if v_img and l_img:
        dest = os.path.join(veh_dir, item['filename'])
        create_showcase_card(v_img, l_img, dest)
    else:
        print(f"FAILED for {item['filename']}: v_img={v_img is not None}, l_img={l_img is not None}")
    time.sleep(1)

print("\nShowcase vehicle cards with logo overlays created successfully!")
