local function stuck_break(inpp)
  while true do
    inpp()
    io.write("ketik 99 untuk keluar: ") 
    local input = tonumber(io.read())
    if input == 99 then
      break
    end
  end
end

local inventori = {"Pedang", "Helmet", "Potion", "Shoes", "Arrow"}
local extra_inv = {"buah", "daging", "sayur", "garam"}

local function cek()
  print("\n-- ISI INVENTORI --")
  for i = 1, #inventori do
    print(i .. ". " .. inventori[i])
  end
end

while true do
  print("\n--- INVENTORI MENU ---")
  print("1. Tambah item")
  print("2. Hapus item")
  print("3. Tampilkan inventori")
  print("4. Jumlah item")
  print("5. Cari item")
  print("6. Keluar")
  io.write("Pilihan: ")
  local pilihan = tonumber(io.read())

  if pilihan == 6 then
    print("Keluar dari Program")
    break

  elseif pilihan == 1 then
    local function tambah_item()
      cek()
      print("\nItem yang tersedia:")
      for i = 1, #extra_inv do
        print(i .. ". " .. extra_inv[i])
      end
      io.write("Pilih item yg akan ditambahkan: ")
      local tambahin = tonumber(io.read())
      if tambahin and tambahin <= #extra_inv then
        table.insert(inventori, extra_inv[tambahin])
        table.remove(extra_inv, tambahin)
        print("Item ditambahkan! (Enter untuk lanjut)")
      end
      cek()
    end
    stuck_break(tambah_item)

  elseif pilihan == 2 then
    local function hapus_item()
      cek()
      io.write("Pilih nomor item yg akan dihapus: ")
      local hapus = tonumber(io.read())
      if hapus and hapus >= 1 and hapus <= #inventori then
        print("Menghapus: " .. inventori[hapus])
        table.remove(inventori, hapus)
      end
      cek()
    end
    stuck_break(hapus_item)

  elseif pilihan == 3 then
    stuck_break(cek)

  elseif pilihan == 4 then
    print("Jumlah item dalam inventori: " .. #inventori)

  elseif pilihan == 5 then
    local function cari_item()
      cek()
      io.write("Masukkan nama item yang dicari: ")
      local cari = io.read()
      local ditemukan = false
      for i = 1, #inventori do
        if string.lower(inventori[i]) == string.lower(cari) then
          print("Item ditemukan di slot " .. i .. ": " .. inventori[i])
          ditemukan = true
        end
      end
      if not ditemukan then
        print("Item tidak ditemukan.")
      end
    end
    stuck_break(cari_item)

  else
    print("Pilihan tidak dikenali. Coba lagi.")
  end
end
