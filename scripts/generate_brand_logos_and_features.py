import os
import io
import math
import urllib.request
import urllib.parse
import json
from PIL import Image, ImageDraw, ImageFont, ImageFilter, ImageEnhance

HEADERS = {'User-Agent': 'VoltSpareIndiaECommerce/1.0 (contact@voltspare.in)'}

def get_wikimedia_thumb(title, width=900):
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
        with urllib.request.urlopen(req, timeout=15) as resp:
            return Image.open(io.BytesIO(resp.read())).convert('RGBA')
    except Exception as e:
        print(f"Failed download {url}: {e}")
        return None

def make_clean_logo_card(img, brand_title, tagline, accent_color=(5, 150, 105), output_path=""):
    canvas = Image.new('RGBA', (512, 512), (255, 255, 255, 255))
    draw = ImageDraw.Draw(canvas)
    
    # Elegant modern white studio card background with subtle gradient & shadow
    for i in range(12):
        alpha = int(14 - i)
        draw.rounded_rectangle([20 - i, 20 - i, 492 + i, 492 + i], radius=28 + i, outline=(0, 0, 0, alpha))
        
    draw.rounded_rectangle([20, 20, 492, 492], radius=28, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
    
    # Top accent bar
    draw.rounded_rectangle([40, 26, 472, 32], radius=3, fill=accent_color)

    # If image provided, fit inside center
    if img:
        # If image has white or transparent background, clean it
        w, h = img.size
        max_w, max_h = 360, 240
        scale = min(max_w / w, max_h / h)
        new_w = int(w * scale)
        new_h = int(h * scale)
        img_resized = img.resize((new_w, new_h), Image.Resampling.LANCZOS)
        
        paste_x = (512 - new_w) // 2
        paste_y = 60 + (240 - new_h) // 2
        
        if img_resized.mode == 'RGBA':
            canvas.paste(img_resized, (paste_x, paste_y), img_resized)
        else:
            canvas.paste(img_resized, (paste_x, paste_y))
            
    # Draw bottom typography
    try:
        font_title = ImageFont.truetype("arialbd.ttf", 30)
        font_sub = ImageFont.truetype("arial.ttf", 16)
    except:
        try:
            font_title = ImageFont.truetype("arial.ttf", 30)
            font_sub = ImageFont.truetype("arial.ttf", 16)
        except:
            font_title = ImageFont.load_default()
            font_sub = ImageFont.load_default()

    # Brand Title
    bbox_t = draw.textbbox((0, 0), brand_title, font=font_title)
    w_t = bbox_t[2] - bbox_t[0]
    draw.text(((512 - w_t) // 2, 385), brand_title, fill=(15, 23, 42, 255), font=font_title)
    
    # Tagline pill badge
    bbox_s = draw.textbbox((0, 0), tagline, font=font_sub)
    w_s = bbox_s[2] - bbox_s[0]
    h_s = bbox_s[3] - bbox_s[1]
    
    badge_x = (512 - w_s - 32) // 2
    draw.rounded_rectangle([badge_x, 435, badge_x + w_s + 32, 435 + h_s + 14], radius=12, fill=(241, 245, 249, 255), outline=(203, 213, 225, 255), width=1)
    draw.text(((512 - w_s) // 2, 442), tagline, fill=(71, 85, 105, 255), font=font_sub)
    
    os.makedirs(os.path.dirname(output_path), exist_ok=True)
    canvas.convert('RGB').save(output_path, 'WEBP', quality=95)
    print(f"-> Generated Logo Card: {output_path} ({os.path.getsize(output_path)} bytes)")

# ==========================================
# 1. GENERATE BRAND LOGOS
# ==========================================
veh_dir = r"d:\sudharsan\spare_website\assets\images\vehicles"

# A. Official Wikimedia Logos
wiki_logos = {
    'hero_motocorp.webp': ('File:Hero_MotoCorp.svg', 'Hero MotoCorp', 'Splendor, HF Deluxe, Glamour, Xpulse', (220, 38, 38)),
    'honda_two_wheeler.webp': ('File:Honda_Logo.svg', 'Honda 2-Wheelers', 'Activa, Shine, Unicorn, SP 125', (220, 38, 38)),
    'bajaj_auto.webp': ('File:Bajaj_Auto_Ltd_logo.svg', 'Bajaj Auto', 'Pulsar, Platina, Avenger, Dominar', (2, 132, 199)),
    'royal_enfield.webp': ('File:Royal_Enfield_logo.svg', 'Royal Enfield', 'Classic 350, Bullet, Hunter, Meteor', (180, 83, 9)),
    'ola_scooter.webp': ('File:OLA_Electric_logo.svg', 'Ola Electric', 'Ola S1 Pro, S1 Air, S1 X, Gen 2', (5, 150, 105)),
}

for filename, (wiki_file, brand_name, tagline, color) in wiki_logos.items():
    thumb_url = get_wikimedia_thumb(wiki_file, width=900)
    img = download_img(thumb_url)
    dest = os.path.join(veh_dir, filename)
    make_clean_logo_card(img, brand_name, tagline, accent_color=color, output_path=dest)

# B. Dedicated High-Res Custom Vector Logos for Brands without clean direct single-layer SVG thumbnails
def generate_tvs_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # TVS Brand Red Text + Prancing Horse emblem
    try:
        f_tvs = ImageFont.truetype("arialbd.ttf", 76)
        f_mot = ImageFont.truetype("arialbd.ttf", 26)
    except:
        f_tvs = ImageFont.load_default()
        f_mot = ImageFont.load_default()
        
    # Blue/Red TVS style
    d.rounded_rectangle([20, 60, 100, 140], radius=16, fill=(220, 38, 38, 255))
    d.polygon([(40, 120), (60, 80), (80, 120)], fill=(255, 255, 255, 255))
    d.text((120, 60), "TVS", fill=(30, 58, 138, 255), font=f_tvs)
    d.text((125, 140), "MOTOR COMPANY", fill=(220, 38, 38, 255), font=f_mot)
    return img

dest = os.path.join(veh_dir, 'tvs_motor.webp')
make_clean_logo_card(generate_tvs_logo(), 'TVS Motor', 'Apache RTR, Jupiter, Raider, Ntorq', accent_color=(220, 38, 38), output_path=dest)

def generate_yamaha_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # Red Yamaha Tuning Fork Circle + YAMAHA typography
    d.ellipse([160, 20, 240, 100], fill=(220, 38, 38, 255))
    # 3 tuning forks
    d.line([(200, 35), (200, 85)], fill=(255, 255, 255, 255), width=6)
    d.line([(175, 75), (225, 45)], fill=(255, 255, 255, 255), width=6)
    d.line([(175, 45), (225, 75)], fill=(255, 255, 255, 255), width=6)
    
    try:
        f_yam = ImageFont.truetype("arialbd.ttf", 52)
    except:
        f_yam = ImageFont.load_default()
    d.text((80, 125), "YAMAHA", fill=(220, 38, 38, 255), font=f_yam)
    return img

dest = os.path.join(veh_dir, 'yamaha.webp')
make_clean_logo_card(generate_yamaha_logo(), 'Yamaha Motor', 'R15 V4, MT-15, FZ-S, RayZR', accent_color=(220, 38, 38), output_path=dest)

def generate_ather_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # Ather Green geometric chevron logo
    d.polygon([(200, 30), (240, 80), (220, 80), (200, 55), (180, 80), (160, 80)], fill=(16, 185, 129, 255))
    d.polygon([(200, 60), (230, 100), (210, 100), (200, 85), (190, 100), (170, 100)], fill=(15, 23, 42, 255))
    try:
        f_ath = ImageFont.truetype("arialbd.ttf", 54)
    except:
        f_ath = ImageFont.load_default()
    d.text((95, 125), "ATHER", fill=(15, 23, 42, 255), font=f_ath)
    return img

dest = os.path.join(veh_dir, 'ather.webp')
make_clean_logo_card(generate_ather_logo(), 'Ather Energy', 'Ather 450X, 450S, 450 Apex, Rizta', accent_color=(16, 185, 129), output_path=dest)

def generate_vida_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # Hero VIDA geometric teal logo
    d.rounded_rectangle([150, 25, 250, 105], radius=20, fill=(6, 182, 212, 255))
    d.polygon([(180, 50), (200, 85), (220, 50)], fill=(255, 255, 255, 255))
    try:
        f_vida = ImageFont.truetype("arialbd.ttf", 50)
        f_by = ImageFont.truetype("arial.ttf", 16)
    except:
        f_vida = ImageFont.load_default()
        f_by = ImageFont.load_default()
    d.text((140, 125), "VIDA", fill=(6, 182, 212, 255), font=f_vida)
    d.text((148, 185), "POWERED BY HERO", fill=(100, 116, 139, 255), font=f_by)
    return img

dest = os.path.join(veh_dir, 'hero_vida.webp')
make_clean_logo_card(generate_vida_logo(), 'Hero Vida', 'Vida V1 Pro, Vida V1 Plus', accent_color=(6, 182, 212), output_path=dest)

def generate_chetak_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # Chetak Classic Emblem
    d.ellipse([155, 25, 245, 105], fill=(30, 41, 59, 255), outline=(217, 119, 6, 255), width=4)
    d.text((178, 45), "C", fill=(217, 119, 6, 255), font=ImageFont.truetype("arialbd.ttf", 45) if os.path.exists("arialbd.ttf") else ImageFont.load_default())
    try:
        f_chet = ImageFont.truetype("arialbd.ttf", 46)
        f_by = ImageFont.truetype("arial.ttf", 16)
    except:
        f_chet = ImageFont.load_default()
        f_by = ImageFont.load_default()
    d.text((105, 125), "CHETAK", fill=(30, 41, 59, 255), font=f_chet)
    d.text((145, 185), "BY BAJAJ AUTO", fill=(100, 116, 139, 255), font=f_by)
    return img

dest = os.path.join(veh_dir, 'bajaj_chetak.webp')
make_clean_logo_card(generate_chetak_logo(), 'Bajaj Chetak', 'Chetak Premium, Chetak Urbane', accent_color=(217, 119, 6), output_path=dest)

def generate_other_ev_logo():
    img = Image.new('RGBA', (400, 240), (255, 255, 255, 0))
    d = ImageDraw.Draw(img)
    # Electric Multi-Brand Universal Emblem
    d.ellipse([155, 25, 245, 105], fill=(5, 150, 105, 255))
    d.polygon([(205, 40), (185, 68), (200, 68), (195, 95), (215, 62), (200, 62)], fill=(255, 255, 255, 255))
    try:
        f_ev = ImageFont.truetype("arialbd.ttf", 44)
        f_sub = ImageFont.truetype("arial.ttf", 16)
    except:
        f_ev = ImageFont.load_default()
        f_sub = ImageFont.load_default()
    d.text((90, 125), "MULTI-EV", fill=(5, 150, 105, 255), font=f_ev)
    d.text((115, 185), "ALL EV 2-WHEELERS", fill=(100, 116, 139, 255), font=f_sub)
    return img

dest = os.path.join(veh_dir, 'other_ev.webp')
make_clean_logo_card(generate_other_ev_logo(), 'Other EV Brands', 'TVS iQube, Simple One, Okinawa, Ampere', accent_color=(5, 150, 105), output_path=dest)

# ==========================================
# 2. GENERATE FEATURES IMAGES (Vehicle Compatibility & Free Shipping)
# ==========================================
feat_dir = r"d:\sudharsan\spare_website\assets\images\features"

def generate_vehicle_compatibility_feature():
    c = Image.new('RGBA', (512, 512), (248, 250, 252, 255))
    d = ImageDraw.Draw(c)
    
    # Outer Card & Glowing Shield
    d.rounded_rectangle([20, 20, 492, 492], radius=28, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
    
    # 3D Shield Emblem in Center
    # Glowing backdrop
    for r in range(40, 0, -5):
        d.ellipse([156 - r, 100 - r, 356 + r, 300 + r], fill=(2, 132, 199, int(3 + (40-r)/5)))
        
    d.polygon([(256, 70), (370, 110), (340, 250), (256, 310), (172, 250), (142, 110)], fill=(2, 132, 199, 255))
    d.polygon([(256, 85), (355, 120), (330, 240), (256, 295), (182, 240), (157, 120)], fill=(14, 165, 233, 255))
    
    # Checkmark inside Shield
    d.line([(200, 180), (240, 230)], fill=(255, 255, 255, 255), width=16)
    d.line([(240, 230), (315, 145)], fill=(255, 255, 255, 255), width=16)
    
    try:
        f_head = ImageFont.truetype("arialbd.ttf", 28)
        f_badge = ImageFont.truetype("arialbd.ttf", 16)
        f_desc = ImageFont.truetype("arial.ttf", 15)
    except:
        f_head = ImageFont.load_default()
        f_badge = ImageFont.load_default()
        f_desc = ImageFont.load_default()
        
    # Title & Badge
    d.text((75, 345), "100% Fitment Verified", fill=(15, 23, 42, 255), font=f_head)
    
    d.rounded_rectangle([115, 395, 395, 430], radius=14, fill=(224, 242, 254, 255), outline=(186, 230, 253, 255))
    d.text((135, 403), "OEM SPEC GUARANTEE", fill=(2, 132, 199, 255), font=f_badge)
    
    d.text((105, 450), "Exact Make, Model & Year Support", fill=(100, 116, 139, 255), font=f_desc)
    
    dest = os.path.join(feat_dir, 'vehicle_compatibility.webp')
    c.convert('RGB').save(dest, 'WEBP', quality=95)
    print(f"-> Generated Feature: {dest} ({os.path.getsize(dest)} bytes)")

def generate_free_shipping_feature():
    c = Image.new('RGBA', (512, 512), (248, 250, 252, 255))
    d = ImageDraw.Draw(c)
    
    # Outer Card
    d.rounded_rectangle([20, 20, 492, 492], radius=28, fill=(255, 255, 255, 255), outline=(226, 232, 240, 255), width=2)
    
    # 3D Express Delivery Box & Zero Cost Badge
    # Cardboard Parcel Box Graphic
    d.polygon([(256, 75), (375, 135), (256, 195), (137, 135)], fill=(217, 119, 6, 255)) # top
    d.polygon([(137, 135), (256, 195), (256, 310), (137, 245)], fill=(180, 83, 9, 255)) # left
    d.polygon([(256, 195), (375, 135), (375, 245), (256, 310)], fill=(245, 158, 11, 255)) # right
    
    # Tape & Ribbon on box
    d.polygon([(235, 85), (275, 65), (275, 305), (235, 305)], fill=(254, 240, 138, 200))
    
    # Green Free Shipping Badge on top right of box
    d.rounded_rectangle([290, 80, 430, 140], radius=16, fill=(5, 150, 105, 255), outline=(255, 255, 255, 255), width=3)
    try:
        f_free = ImageFont.truetype("arialbd.ttf", 22)
        f_head = ImageFont.truetype("arialbd.ttf", 28)
        f_sub = ImageFont.truetype("arial.ttf", 15)
    except:
        f_free = ImageFont.load_default()
        f_head = ImageFont.load_default()
        f_sub = ImageFont.load_default()
    d.text((310, 95), "FREE ₹0", fill=(255, 255, 255, 255), font=f_free)
    
    # Bottom text
    d.text((105, 345), "Free Pan-India Delivery", fill=(15, 23, 42, 255), font=f_head)
    
    d.rounded_rectangle([130, 395, 380, 430], radius=14, fill=(236, 253, 245, 255), outline=(167, 243, 208, 255))
    d.text((150, 403), "ON ORDERS ABOVE ₹499", fill=(5, 150, 105, 255), font=f_free)
    
    d.text((115, 450), "Secure Packing & Tracking Included", fill=(100, 116, 139, 255), font=f_sub)
    
    dest = os.path.join(feat_dir, 'free_shipping.webp')
    c.convert('RGB').save(dest, 'WEBP', quality=95)
    print(f"-> Generated Feature: {dest} ({os.path.getsize(dest)} bytes)")

generate_vehicle_compatibility_feature()
generate_free_shipping_feature()
print("All logos and features successfully generated.")
