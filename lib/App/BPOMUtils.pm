package App::BPOMUtils;

use 5.010001;
use strict 'subs', 'vars';
use warnings;
use Log::ger;

use Perinci::Sub::Gen::AccessTable qw(gen_read_table_func);

# AUTHORITY
# DATE
# DIST
# VERSION

our %SPEC;

$SPEC{':package'} = {
    v => 1.1,
    summary => 'Utilities related to BPOM',
};

# BEGIN FRAGMENT id=meta-idn_bpom_jenis_pangan varname=meta_idn_bpom_jenis_pangan
# note: This fragment's content is generated by a script. Do not edit manually!
# src-file: /home/u1/repos/gudangdata/bin/../table/idn_bpom_jenis_pangan/meta.yaml
# src-revision: af94cdd555c6f073ea23dd0103db863e901d0db4 (Fri Aug 27 16:44:47 2021 +0700)
# generate-date: Fri Aug 27 09:45:14 2021 UTC
# generated-by: update-fragments-in-perl-module
our $meta_idn_bpom_jenis_pangan = {
  "fields" => {
    code => {
      pos => 0,
      schema => ["str*", { match => "^[0-9]+\$" }],
      sortable => "Yes",
      summary => "code",
    },
    summary => {
      pos      => 1,
      schema   => ["str*"],
      sortable => "Yes",
      summary  => "Summary",
      unique   => "No",
    },
  },
  "pk" => "code",
  "summary" => "Food types in BPOM processed food division",
  "summary.alt.lang.id_ID" => "Jenis pangan di BPOM pangan olahan",
};
# END FRAGMENT id=meta-idn_bpom_jenis_pangan

# BEGIN FRAGMENT id=data-idn_bpom_jenis_pangan varname=data_idn_bpom_jenis_pangan
# note: This fragment's content is generated by a script. Do not edit manually!
# src-file: /home/u1/repos/gudangdata/bin/../table/idn_bpom_jenis_pangan/data.csv
# src-revision: af94cdd555c6f073ea23dd0103db863e901d0db4 (Fri Aug 27 16:44:47 2021 +0700)
# generate-date: Fri Aug 27 09:45:14 2021 UTC
# generated-by: update-fragments-in-perl-module
our $data_idn_bpom_jenis_pangan = [
  ["code", "summary"],
  ["001", "Susu Pasteurisasi"],
  ["002", "Susu UHT"],
  ["003", "Susu Steril"],
  ["004", "Susu Skim"],
  ["005", "Susu Lemak Nabati"],
  ["006", "Buttermilk"],
  ["007", "Dadih"],
  ["008", "Minuman Susu"],
  ["009", "Minuman dengan/ mengandung Susu"],
  ["010", "Minuman Susu Fermentasi"],
  ["011", "Minuman Yoghurt"],
  ["012", "Lassi"],
  ["013", "Susu Diasamkan"],
  ["014", "Susu Fermentasi"],
  ["015", "Yogurt"],
  ["016", "Susu yang Digumpalkan dengan Enzim Renin"],
  ["017", "Susu Evaporasi"],
  ["018", "Susu Kental Manis"],
  ["019", "Susu Skim Kental Manis"],
  ["020", "Krim Kental Manis"],
  ["021", "Krimer Kental Manis"],
  ["022", "Khoa"],
  ["023", "Krimer Minuman (Bukan Susu)"],
  ["024", "Krim"],
  ["025", "Whipped Cream"],
  ["026", "Krim yang digumpalkan"],
  ["027", "Krim Nabati (Krim Analog)"],
  ["028", "Susu Bubuk Berlemak (Full Cream)"],
  ["029", "Susu Skim Bubuk"],
  ["030", "Krim Bubuk"],
  ["031", "Susu dan Krim Bubuk Analog"],
  ["032", "Susu Bubuk Lemak/Minyak Nabati"],
  ["033", "Buttermilk Bubuk"],
  ["034", "Keju Analog"],
  ["035", "Keju Tanpa Pemeraman"],
  ["035", "Keju tanpa Pemeraman (Keju Mentah)"],
  ["036", "Keju Peram"],
  ["037", "Kulit Keju Peram"],
  ["038", "Keju Bubuk"],
  ["039", "Keju Whey"],
  ["040", "Keju Olahan"],
  ["041", "Es Krim"],
  ["042", "Es Susu / Es Mengandung Susu"],
  ["043", "Makanan Pencuci Mulut Berbahan Dasar Susu"],
  ["044", "Puding (Berbahan dasar susu atau bahan lainnya)"],
  ["045", "Whey"],
  ["046", "Whey Bubuk"],
  ["047", "Kolostrum"],
  ["048", "Bahan untuk Es Krim / Bahan untuk Es Susu"],
  ["049", "Bahan untuk Puding (Bubuk)"],
  ["050", "Susu Bubuk"],
  ["078", "Ghee"],
  ["079", "Virgin Oil"],
  ["080", "Cold Pressed Oils"],
  ["081", "Minyak Goreng (Frying Oil atau frying fat)"],
  ["082", "Minyak Masak atau Minyak Sayur (Cooking Oil)"],
  ["083", "Minyak Salad"],
  ["084", "Minyak serbuk"],
  ["085", "Vanaspati atau Minyak Samin (Vegetable Ghee)"],
  ["086", "Lemak Reroti (Shortening)"],
  ["087", "Pengganti Minyak mentega (Butter Oil Substitute)"],
  [
    "088",
    "Minyak Kelapa Sawit (Refined Bleached Deodorized Palm Oil/RBDPO)",
  ],
  [
    "089",
    "Minyak Olein Kelapa Sawit (Refined Bleached Deodorized Palm Olein)",
  ],
  [
    "090",
    "Minyak Stearin Kelapa Sawit (Refined Bleached Deodorized Palm stearin)",
  ],
  [
    "091",
    "Minyak Kelapa (Refined Bleached Deodorized Coconut Oil)",
  ],
  [
    "092",
    "Minyak Kacang Tanah (Refined Bleached Deodorized Peanut Oil/Refined Bleached Deodorized Groundnut Oil)",
  ],
  ["093", "Minyak Jagung (Refined Bleached Deodorized Corn Oil)"],
  [
    "094",
    "Minyak Kemiri (Refined Bleached Deodorized Candlenut/Limbang Oil)",
  ],
  [
    "095",
    "Minyak Kedelai (Refined Bleached Deodorized Soyabean Oil)",
  ],
  ["096", "Minyak Wijen (Sesame Oil)"],
  [
    "097",
    "Minyak Zaitun (Refined Bleached Deodorized Olive Oil)",
  ],
  ["098", "Minyak Safflower"],
  ["099", "Minyak Biji Bunga Matahari"],
  [
    100,
    "Minyak Dedak atau Minyak Bekatul atau Minyak Katul (Refined Bleached Deodorized Rice Brand Oil)",
  ],
  [
    101,
    "Minyak Biji Kapas (Refined Bleached Deodorized Cottonseed Oil)",
  ],
  [
    102,
    "Rapeseed oil (turnip rape oil/colza oil/ravison oil/sarson oil/toria oil)",
  ],
  [
    103,
    "Mustardseed Oil (Refined Bleached Deodorized Mustardseed Oil)",
  ],
  [104, "Lemak Hewani"],
  [105, "Minyak Ikan"],
  [106, "Mentega"],
  [107, "Margarin"],
  [
    108,
    "Campuran Margarin dan Mentega (Blends of Butter and Margarine)",
  ],
  [109, "Emulsi yang Mengandung Lemak Kurang Dari 80%"],
  [110, "Emulsi lemak dan makanan pencuci mulut berbasis lemak"],
  [111, "Es krim non dairy"],
  [112, "Minyak Nabati Lainnya"],
  [142, "Es selain es krim dan es susu"],
  [
    143,
    "Sediaan Cair atau Serbuk yang akan Dikonsumsi dalam Keadaan Beku",
  ],
  [174, "Manisan Buah"],
  [174, "Manisan Gula"],
  [175, "Buah Kering"],
  [176, "Asinan Buah"],
  [177, "Buah dalam ...... (medianya) kemasan"],
  [178, "Jem (Selai), Jeli dan Marmalad"],
  [179, "Sambal buah"],
  [180, "Bubur Buah, Puree Buah, Pasta Buah"],
  [181, "Saus Buah/Topping buah"],
  [181, "Saus Buah/Topping Buah"],
  [182, "Hasil olah kelapa"],
  [183, "Konsentrat Asam Jawa/Tamarin"],
  [184, "Buah Bubuk"],
  [185, "Makanan Pencuci Mulut"],
  [186, "Cincau"],
  [187, "Acar buah/ Produk Fermentasi Buah"],
  [188, "Lempok Buah"],
  [189, "Geplak"],
  [190, "Sayur beku"],
  [191, "Sayur Kering"],
  [192, "Rumput laut Kering"],
  [193, "Biji-Bjian / Kacang-Kacangan Kering"],
  [194, "Emping"],
  [195, "Sayur bubuk"],
  [196, "Sayur/ Jamur/Buah dalam Media Minyak"],
  [197, "Sayur Asin"],
  [198, "Acar Sayur / Produk Fermentasi Sayur"],
  [199, "Sayur dan Kacang dalam Kemasan"],
  [200, "Pasta sayur, bubur sayur, puree sayur, saus sayur"],
  [201, "Pasta Biji-bijian"],
  [202, "Produk sayur lain"],
  [202, "Produk Sayur Lain"],
  [203, "Olahan Buah Lainnya"],
  [233, "Kakao Bubuk"],
  [234, "Kakao Nib"],
  [235, "Massa Kakao dan Cairan Kental (Liquor) Cokelat"],
  [236, "Keik Kakao (Cococa Press Cake)"],
  [237, "Minuman Kakao/Cokelat"],
  [238, "Cokelat Instan"],
  [239, "Pasta coklat"],
  [240, "Cokelat"],
  [241, "Permen Cokelat/Permen Isi Cokelat"],
  [242, "Lemak kakao (Cocoa Butter)"],
  [243, "Produk Cokelat Analog/ Pengganti Cokelat"],
  [244, "Kembang Gula/permen Keras"],
  [245, "Kembang Gula/Permen Lunak"],
  [246, "Nougat, Marzipan"],
  [247, "Kembang Gula/Permen Karet"],
  [248, "Dekorasi, Topping (Non-Buah) dan Saus Manis"],
  [249, "Kakao Bubuk Lainnya"],
  [279, "Beras Diperkaya"],
  [281, "Tepung Beras (Beras, Beras Ketan)"],
  [282, "Tepung Jagung"],
  [283, "Tepung Kacang-Kacangan"],
  [284, "Tepung Kedelai"],
  [285, "Tepung Gandum / Pati Gandum"],
  [286, "Tepung Jewawut (Pearl Millet Flour)"],
  [287, "Tepung sorgum"],
  [288, "Tepung Terigu"],
  [289, "Tepung Gluten Terigu (Wheat Gluten Powder)"],
  [290, "Tepung Kulit Ari (Fine Bran)"],
  [291, "Tepung / Pati"],
  [293, "Dekstrin"],
  [294, "Tepung Gaplek"],
  [295, "Tepung Aren"],
  [296, "Pati Garut"],
  [297, "Pati Jagung atau Maizena"],
  [298, "Pati Sagu"],
  [299, "Tepung Hunkwee/Pati Kacang hijau"],
  [300, "Tapioka / Pati Singkong/Gari"],
  [301, "Pati Termodifikasi"],
  [304, "Nasi Jagung"],
  [305, "Sereal Siap Saji Termasuk Sereal Sarapan"],
  [306, "Tiwul"],
  [307, "Degermed Maize (Corn) Grits"],
  [308, "Mi Basah"],
  [309, "Kulit Pangsit"],
  [310, "Kuetiauw"],
  [311, "Pasta"],
  [312, "Sohun"],
  [313, "Bihun"],
  [314, "Mi Kering"],
  [315, "Mi instan"],
  [316, "Nasi Instan"],
  [
    317,
    "Makanan Pencuci Mulut Berbasis Serealia dan Pati (Misalnya Puding Nasi, Puding Tapioka)",
  ],
  [318, "Tepung Bumbu"],
  [319, "Kue berbahan dasar beras"],
  [320, "Minuman/Sari Kedelai"],
  [321, "Kembang Tahu"],
  [321, "KembangTahu"],
  [322, "Tahu"],
  [323, "Produk Kedelai Fermentasi"],
  [325, "Bubur Instan (Rasa Ayam, dll)"],
  [
    326,
    "Biji-Bijian dan Kacang-Kacangan (Utuh, Patahan, atau Serpihan)",
  ],
  [327, "Kerupuk Mentah"],
  [328, "Produk Protein Kedelai Lainnya"],
  [329, "Olahan dari Tepung/Pati"],
  [354, "Roti"],
  [355, "Krekers"],
  [356, "Biskuit"],
  [357, "Tepung Roti"],
  [358, "Roti Kukus"],
  [359, "Premiks untuk Bakeri /Untuk Stufing"],
  [360, "Keik (Cake)"],
  [361, "Wafer"],
  [362, "Kukis"],
  [363, "Kue (Contoh: bika ambon, cucur, cakue, dll)"],
  [
    395,
    "Daging Sapi Olahan / Daging Kerbau Olahan/Daging Rusa Olahan",
  ],
  [396, "Daging Babi Olahan"],
  [397, "Daging Ayam Olahan"],
  [
    398,
    "Produk Daging Campuran Olahan (terdiri dari 2 macam atau lebih)",
  ],
  [399, "Daging lain olahan"],
  [400, "Daging Analog"],
  [402, "Daging Kambing atau Daging Olahan"],
  [402, "Daging Kambing atau Domba Olahan"],
  [402, "Daging Kambing atau Domnba Olahan"],
  [432, "Ikan Olahan"],
  [435, "Udang Olahan"],
  [436, "Rajungan/Kepiting Olahan"],
  [437, "Produk olahan ikan lain"],
  [438, "Telur Ikan Olahan"],
  [439, "Ikan dalam kaleng"],
  [441, "Produk Ikan Olahan Lain dalam Kaleng"],
  [474, "Produk Telur Olahan"],
  [475, "Tepung telur"],
  [476, "Telur awetan"],
  [477, "Makanan Pencuci Mulut Berbahan Dasar Telur"],
  [478, "Ikan dan Olahan Analog"],
  [508, "Dekstrosa"],
  [509, "Fruktosa"],
  [510, "Tepung Gula atau Gula Halus"],
  [511, "Gula Merah"],
  [512, "Sirup Glukosa"],
  [513, "Glukosa"],
  [514, "Gula Kristal Putih atau Gula Pasir"],
  [515, "Laktosa"],
  [516, "Sirup Fruktosa (High Fructose Syrup/HFS)"],
  [517, "Tetes Tebu atau Molases"],
  [518, "Gula Invert"],
  [520, "Sirup lain"],
  [521, "Madu"],
  [522, "Sediaan Pemanis (Table Top)"],
  [524, "Gula Batu"],
  [553, "Garam"],
  [555, "Pengganti Garam"],
  [556, "Bumbu dan kondimen"],
  [556, "Bumbu dan Kondimen"],
  [557, "Cuka"],
  [558, "Arak masak (Angciu)"],
  [559, "Sup"],
  [560, "Sari Pati Ayam"],
  [561, "Kaldu"],
  [562, "Mayonais/Salad Dressing"],
  [563, "Sambal"],
  [564, "Saus Bumbu"],
  [565, "Saus Tomat"],
  [566, "Kecap selain kedelai"],
  [567, "Bubuk Untuk Saus dan Gravies"],
  [568, "Produk Oles Untuk Salad"],
  [569, "Ragi"],
  [570, "Pasta kedelai fermentasi"],
  [571, "Saus kedelai"],
  [572, "Kecap (Berbasis kedelai)"],
  [573, "Produk protein"],
  [574, "Mustard"],
  [596, "Ragi"],
  [604, "Formula bayi"],
  [605, "Formula Lanjutan"],
  [606, "Formula Pertumbuhan"],
  [610, "Makanan Diet Diabetes"],
  [
    613,
    "Makanan formula sebagai makanan diet kontrol berat badan",
  ],
  [615, "Pangan Ibu Hamil dan Pangan Ibu Menyusui"],
  [651, "Air mineral alami"],
  [652, "Air Minum dalam Kemasan (AMDK)"],
  [653, "Air Bermineral"],
  [654, "Air Soda"],
  [655, "Air minum Beroksigen"],
  [657, "Sari Buah"],
  [658, "Sari Sayur"],
  [659, "Sari buah dan sari sayuran"],
  [660, "Konsentrat Sari Buah"],
  [661, "Konsentrat Sari Sayur"],
  [662, "Konsentrat Sari Buah dan Sari Sayuran"],
  [663, "Nektar Buah/Sayur"],
  [664, "Konsentrat Nektar Buah/Sayur"],
  [665, "Minuman Berperisa Berkarbonat"],
  [666, "Minuman Berperisa tidak Berkarbonat"],
  [667, "Minuman Elektrolit Berkarbonat"],
  [668, "Minuman Elektrolit Tidak Berkarbonat"],
  [669, "Minuman Serbuk Berkarbonat"],
  [670, "Minuman Serbuk Tidak Berkarbonat"],
  [671, "Minuman Sari Buah"],
  [672, "Sirup Berperisa"],
  [673, "Sirup buah"],
  [674, "Sirup coklat, sirup karamel, sirup kopi"],
  [675, "Squash"],
  [
    677,
    "Minuman Botanikal/ Minuman lain-lain (asam jawa, nira, dll)",
  ],
  [678, "Minuman Nata De Coco / Jeli"],
  [679, "Teh Fermentasi"],
  [680, "Teh Olong atau Teh semi Fermentasi"],
  [681, "Teh tanpa Fermentasi"],
  [682, "Teh wangi"],
  [683, "Minuman Teh"],
  [684, "Teh instan"],
  [685, "Konsentrat teh"],
  [686, "Biji kopi"],
  [687, "Kopi"],
  [688, "Minuman Kopi (Siap Minum)"],
  [689, "Konsentrat kopi"],
  [690, "Minuman Botanikal"],
  [691, "Minuman sari kacang hijau"],
  [702, "Minuman Tradisional"],
  [703, "Minuman Konsentrat"],
  [704, "Sirup Teh"],
  [705, "Minuman Biji-Bijian dan Sereal"],
  [728, "Keripik"],
  [729, "Makanan ringan simulasi"],
  [730, "Makanan ringan lain"],
  [731, "Pilus"],
  [732, "Berondong"],
  [733, "Marning"],
  [734, "Jipang"],
  [735, "Kerupuk"],
  [736, "Rengginang / Ekivalen / Batiah"],
  [737, "Makanan ringan Ekstrudat"],
  [738, "Makanan ringan kacang"],
  [739, "Kemplang"],
  [740, "Getas"],
  [758, "Pangan Siap Saji (Terkemas)"],
  [758, "Pangan Siap Saji Terkemas"],
  [759, "Sup Sayuran"],
  [760, "Sup Jamur"],
  [761, "Pangsit Isi (Sayuran, Daging, dll)"],
  [762, "Jajanan Pasar"],
  [763, "Kebab/Roti Isi Daging/Tortilla Isi Daging"],
  [764, "Pasta Instan"],
  [765, "Kombinasi Pangan Olahan"],
  [766, "Olahan Gluten"],
  [767, "Kolak"],
  [789, "Bahan Tambahan Pangan"],
];
# END FRAGMENT id=data-idn_bpom_jenis_pangan

our $meta_reg_code_prefixes = {
  summary => "Known alphabetical prefixes in BPOM registered product codes",
  "fields" => {
    code => {
      pos => 0,
      schema => ["str*"],
      sortable => 1,
      summary => "code",
    },
    division => {
      pos      => 1,
      schema   => ["str*"],
      sortable => 1,
      summary  => "Division (food, supplement [including herbal], medicine)",
      unique   => 0,
    },
    summary_eng => {
      pos      => 2,
      schema   => ["str*"],
      sortable => 1,
      summary  => "Summary (in English)",
      unique   => 0,
    },
    summary_ind => {
      pos      => 3,
      schema   => ["str*"],
      sortable => 1,
      summary  => "Summary (in Indonesian)",
      unique   => 0,
    },
  },
  "pk" => "code",
  "summary" => "BPOM registered product code prefixes",
  "summary.alt.lang.id_ID" => "Awalan huruf di kode produk terdaftar BPOM",
};

our $data_reg_code_prefixes = [
    ["MD", "food", "Food (local)", "Makanan (dalam negeri)"],
    ["ML", "food", "Food (imported)", "Makanan (impor)"],


    # ?N? and ?P? codes currently are not listed here

    ["DBL", "medicine", "Local (L) OTC (B) patented (D) medicine", "Obat paten (D) bebas (B) lokal (L)"],
    ["DBI", "medicine", "Imported (L) OTC (B) patented (D) medicine", "Obat paten (D) bebas (B) impor (I)"],
    ["DBE", "medicine", "Exported (L) OTC (B) patented (D) medicine", "Obat paten (D) bebas (B) ekspor (E)"],
    ["DBX", "medicine", "Special-purpose (X) OTC (B) patented (D) medicine", "Obat paten (D) bebas (B) keperluan khusus (X)"],

    ["DTL", "medicine", "Local (L) limited-OTC (T) patented (D) medicine", "Obat paten (D) bebas terbatas (T) lokal (L)"],
    ["DTI", "medicine", "Imported (L) limited-OTC (T) patented (D) medicine", "Obat paten (D) bebas terbatas (T) impor (I)"],
    ["DTE", "medicine", "Exported (L) limited-OTC (T) patented (D) medicine", "Obat paten (D) bebas terbatas (T) ekspor (E)"],
    ["DTX", "medicine", "Special-purpose (X) limited-OTC (T) patented (D) medicine", "Obat paten (D) bebas terbatas (T) keperluan khusus (X)"],

    ["DKL", "medicine", "Local (L) hard (K) patented (D) medicine", "Obat paten (D) keras (K) lokal (L)"],
    ["DKI", "medicine", "Imported (L) hard (K) patented (D) medicine", "Obat paten (D) keras (K) impor (I)"],
    ["DKE", "medicine", "Exported (L) hard (K) patented (D) medicine", "Obat paten (D) keras (K) ekspor (E)"],
    ["DKX", "medicine", "Special-purpose (X) hard (K) patented (D) medicine", "Obat paten (D) keras (K) keperluan khusus (X)"],

    ["GBL", "medicine", "Local (L) OTC (B) generic (G) medicine", "Obat generik (G) bebas (B) lokal (L)"],
    ["GBI", "medicine", "Imported (L) OTC (B) generic (G) medicine", "Obat generik (G) bebas (B) impor (I)"],
    ["GBE", "medicine", "Exported (L) OTC (B) generic (G) medicine", "Obat generik (G) bebas (B) ekspor (E)"],
    ["GBX", "medicine", "Special-purpose (X) OTC (B) generic (G) medicine", "Obat generik (G) bebas (B) keperluan khusus (X)"],

    ["GTL", "medicine", "Local (L) limited-OTC (T) generic (G) medicine", "Obat generik (G) bebas terbatas (T) lokal (L)"],
    ["GTI", "medicine", "Imported (L) limited-OTC (T) generic (G) medicine", "Obat generik (G) bebas terbatas (T) impor (I)"],
    ["GTE", "medicine", "Exported (L) limited-OTC (T) generic (G) medicine", "Obat generik (G) bebas terbatas (T) ekspor (E)"],
    ["GTX", "medicine", "Special-purpose (X) limited-OTC (T) generic (G) medicine", "Obat generik (G) bebas terbatas (T) keperluan khusus (X)"],

    ["GKL", "medicine", "Local (L) hard (K) generic (G) medicine", "Obat generik (G) keras (K) lokal (L)"],
    ["GKI", "medicine", "Imported (L) hard (K) generic (G) medicine", "Obat generik (G) keras (K) impor (I)"],
    ["GKE", "medicine", "Exported (L) hard (K) generic (G) medicine", "Obat generik (G) keras (K) ekspor (E)"],
    ["GKX", "medicine", "Special-purpose (X) hard (K) generic (G) medicine", "Obat generik (G) keras (K) keperluan khusus (X)"],


    ["SD", "supplement+cosmetic", "Local supplement", "Suplemen dalam negeri"],
    ["SI", "supplement+cosmetic", "Imported supplement", "Suplemen impor"],
    ["SL", "supplement+cosmetic", "Licensed Supplement", "Suplemen dalam negeri dengan lisensi"],

    ["BTR", "supplement+cosmetic", "Local traditional medicine/production medicine", "Obat tradisional berbatasan dengan obat produksi, dalam negeri"],
    ["BTI", "supplement+cosmetic", "Imported traditional medicine/production medicine", "Obat tradisional berbatasan dengan obat produksi, impor"],
    ["BTL", "supplement+cosmetic", "Licensed traditional medicine/production medicine", "Obat tradisional berbatasan dengan obat produksi, dalam negeri dengan lisensi"],

    ["NA", "supplement+cosmetic", "Cosmetics from Asia including local", "Kosmetik dari Asia termasuk lokal"],
    ["NB", "supplement+cosmetic", "Cosmetics from Australia", "Kosmetik dari Australia"],
    ["NC", "supplement+cosmetic", "Cosmetics from Europe", "Kosmetik dari Eropa"],
    ["ND", "supplement+cosmetic", "Cosmetics from Africa", "Kosmetik dari Afrika"],
    ["NE", "supplement+cosmetic", "Cosmetics from America", "Kosmetik dari Amerika"],
];

my $res;

$res = gen_read_table_func(
    name => 'bpom_list_food_types',
    summary => 'List food types in BPOM processed food division',
    table_data => $data_idn_bpom_jenis_pangan,
    table_spec => {
        summary => 'Food types in BPOM processed food division',
        fields => {
            code => {
                summary => 'Code',
                schema => 'str*',
                pos => 0,
                sortable => 1,
            },
            summary => {
                summary => 'Summary',
                schema => 'str*',
                pos => 1,
                sortable => 1,
            },
        },
        pk => 'code',
    },
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

$res = gen_read_table_func(
    name => 'bpom_list_reg_code_prefixes',
    summary => 'List known alphabetical prefixes in BPOM registered product codes',
    table_data => $data_reg_code_prefixes,
    table_spec => $meta_reg_code_prefixes,
    description => <<'_',
_
    extra_props => {
        examples => [
        ],
    },
);
die "Can't generate function: $res->[0] - $res->[1]" unless $res->[0] == 200;

sub _nearest {
    require Math::Round;
    Math::Round::nearest(@_);
}

$SPEC{bpom_show_nutrition_facts} = {
    v => 1.1,
    summary => 'Round values and format them as nutrition fact table (ING - informasi nilai gizi)',
    args => {
        name => {schema=>'str*'},

        # XXX output_format: vertical table, horizontal table, simple table, csv. currently only simple table is supported

        fat           => {summary => 'Total fat, in g/100g'           , schema => 'ufloat*', req=>1},
        saturated_fat => {summary => 'Saturated fat, in g/100g'       , schema => 'ufloat*', req=>1},
        protein       => {summary => 'Protein, in g/100g'             , schema => 'ufloat*', req=>1},
        carbohydrate  => {summary => 'Total carbohydrate, in g/100g'  , schema => 'ufloat*', req=>1},
        sugar         => {summary => 'Total sugar, in g/100g'         , schema => 'ufloat*', req=>1},
        sodium        => {summary => 'Sodium, in mg/100g'             , schema => 'ufloat*', req=>1},

        serving_size  => {summary => 'Serving size, in g'             , schema => 'ufloat*', req=>1},
    },

    examples => [
        {
            summary => 'An example',
            args => {fat=>0.223, saturated_fat=>0.010, protein=>0.990, carbohydrate=>13.113, sugar=>7.173, sodium=>0.223, serving_size=>75},
            test => 0,
        }
    ],
};
sub bpom_show_nutrition_facts {
    my %args = @_;

    my @rows;

  ENERGY: {
        my $code_round_energy = sub {
            my $val = shift;
            if ($val < 5)      { 0 }
            elsif ($val <= 50) { _nearest( 5, $val) }
            else               { _nearest(10, $val) }
        };

        my $val0 = $args{fat} * 9 + $args{protein} * 4 + $args{carbohydrate} * 4;
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_energy->($val);
        push @rows, {
            name_eng => 'Total energy',
            name_ind => 'Energi total',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
            pct_dv        => $val/2150*100,
            pct_dv_R      => _nearest(1, $val/2150*100),
        };

      ENERGY_FROM_FAT: {
            my $val0 = $args{fat} * 9;
            my $val  = $val0*$args{serving_size}/100;
            my $valr = $code_round_energy->($val);
            push @rows, {
                name_eng => 'Energy from fat',
                name_ind => 'Energi dari lemak',
                val_per_100g  => $val0,
                val_per_srv   => $val,
                val_per_srv_R => $valr,
            };
        }

      ENERGY_FROM_SATURATED_FAT: {
            my $val0 = $args{saturated_fat} * 9;
            my $val  = $val0*$args{serving_size}/100;
            my $valr = $code_round_energy->($val);
            push @rows, {
                name_eng => 'Energy from saturated fat',
                name_ind => 'Energi dari lemak jenuh',
                val_per_100g  => $val0,
                val_per_srv   => $val,
                val_per_srv_R => $valr,
            };
        }
    } # ENERGY

  FAT: {
        my $code_round_fat = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            elsif ($val <= 5)  { sprintf("%.1f", _nearest(0.5, $val)) }
            else               { _nearest(1  , $val) }
        };
        my $code_round_fat_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{fat};
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_fat->($val);
        push @rows, {
            name_eng => 'Total fat',
            name_ind => 'Lemak total',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
            pct_dv   => $val/67*100,
            pct_dv_R => $code_round_fat_pct_dv->($val/67*100, $valr),
        };

      SATURATED_FAT: {
            my $val0 = $args{saturated_fat};
            my $val  = $val0*$args{serving_size}/100;
            my $valr = $code_round_fat->($val);
            push @rows, {
                name_eng => 'Saturated fat',
                name_ind => 'Lemak jenuh',
                val_per_100g  => $val0,
                val_per_srv   => $val,
                val_per_srv_R => $valr,
                pct_dv   => $val/20*100,
                pct_dv_R => $code_round_fat_pct_dv->($val/20*100, $valr),
            };
        }
    } # FAT

  PROTEIN: {
        my $code_round_protein = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };
        my $code_round_protein_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{protein};
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_protein->($val);
        push @rows, {
            name_eng => 'Protein',
            name_ind => 'Protein',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
            pct_dv   => $val/60*100,
            pct_dv_R => $code_round_protein_pct_dv->($val/60*100, $valr),
        };
    }

  CARBOHYDRATE: {
        my $code_round_carbohydrate = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };
        my $code_round_carbohydrate_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{carbohydrate};
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_carbohydrate->($val);
        push @rows, {
            name_eng => 'Total carbohydrate',
            name_ind => 'Karbohidrat total',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
            pct_dv   => $val/325*100,
            pct_dv_R => $code_round_carbohydrate_pct_dv->($val/325*100, $valr),
        };
    }

  SUGAR: {
        my $code_round_sugar = sub {
            my $val = shift;
            if ($val < 0.5)    { 0 }
            else               { _nearest(1  , $val) }
        };

        my $val0 = $args{sugar};
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_sugar->($val);
        push @rows, {
            name_eng => 'Total sugar',
            name_ind => 'Gula total',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
        };
    }

  SODIUM: {
        my $code_round_sodium = sub {
            my $val = shift;
            if ($val < 5)       { 0 }
            elsif ($val <= 140) { _nearest( 5, $val) }
            else                { _nearest(10, $val) }
        };
        my $code_round_sodium_pct_dv = sub {
            my ($val, $fat_valr) = @_;
            if ($fat_valr == 0) { 0 }
            else                { _nearest(1  , $val) }
        };

        my $val0 = $args{sodium};
        my $val  = $val0*$args{serving_size}/100;
        my $valr = $code_round_sodium->($val);
        push @rows, {
            name_eng => 'Salt (Sodium)',
            name_ind => 'Garam (Natrium)',
            val_per_100g  => $val0,
            val_per_srv   => $val,
            val_per_srv_R => $valr,
            pct_dv   => $val/325*100,
            pct_dv_R => $code_round_sodium_pct_dv->($val/325*100, $valr),
        };
    }

    [200, "OK", \@rows, {'table.fields'=>[qw/name_eng name_ind val_per_100g val_per_srv val_per_srv_R pct_dv pct_dv_R/]}];
}

1;
#ABSTRACT:

=head1 SYNOPSIS

 # Use via the included scripts


=head1 DESCRIPTION

This distribution includes CLI utilities related to BPOM (Badan Pengawas Obat
dan Makanan, Indonesian equivalent of Food & Drug Administration authority).

# INSERT_EXECS_LIST


=head1 SEE ALSO

L<https://pom.go.id>

L<Business::ID::BPOM>

=cut
