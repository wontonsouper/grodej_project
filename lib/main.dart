import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grodej',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const GrodejHomePage(),
    );
  }
}

class GrodejHomePage extends StatefulWidget {
  const GrodejHomePage({Key? key}) : super(key: key);

  @override
  _GrodejHomePageState createState() => _GrodejHomePageState();
}

class _GrodejHomePageState extends State<GrodejHomePage> {
  bool _isPromotionExpanded = true;
  bool _isProductExpanded = true;
  bool _isBestSellerExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grodej'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // TODO: Tampilkan keranjang belanja
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildCompanyWidget(),
            const SizedBox(height: 16),
            _buildCategorySection(),
            const SizedBox(height: 16),
            _buildProductSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySection() {
    return Container(
      height: 100,
      color: Colors.grey[200],
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildCategoryItem('Promosi', _isPromotionExpanded),
          _buildCategoryItem('Nama Produk', _isProductExpanded),
          _buildCategoryItem('Terlaris', _isBestSellerExpanded),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String title, bool isExpanded) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (title == 'Promosi') {
                  _isPromotionExpanded = !_isPromotionExpanded;
                } else if (title == 'Nama Produk') {
                  _isProductExpanded = !_isProductExpanded;
                } else if (title == 'Terlaris') {
                  _isBestSellerExpanded = !_isBestSellerExpanded;
                }
              });
            },
            child: Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (isExpanded) const SizedBox(height: 8),
          if (isExpanded)
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: isExpanded ? 50 : 0,
              child: Text('Content goes here'),
            ),
        ],
      ),
    );
  }

  Widget _buildProductSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildSectionTitle(context, 'Promosi'),
          if (_isPromotionExpanded) ...[
            const SizedBox(height: 16),
            _buildProductItem('Produk Promosi 1', 'Deskripsi Produk Promosi 1'),
            _buildProductItem('Produk Promosi 2', 'Deskripsi Produk Promosi 2'),
          ],
          const SizedBox(height: 16),
          _buildSectionTitle(context, 'Nama Produk'),
          if (_isProductExpanded) ...[
            const SizedBox(height: 16),
            _buildProductItem('Produk 1', 'Deskripsi Produk 1'),
            _buildProductItem('Produk 2', 'Deskripsi Produk 2'),
          ],
          const SizedBox(height: 16),
          _buildSectionTitle(context, 'Terlaris'),
          if (_isBestSellerExpanded) ...[
            const SizedBox(height: 16),
            _buildProductItem('Produk Terlaris 1', 'Deskripsi Produk Terlaris 1'),
            _buildProductItem('Produk Terlaris 2', 'Deskripsi Produk Terlaris 2'),
          ],
        ],
      ),
    );
  }git

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Widget _buildProductItem(String name, String description) {
    return Card(
      elevation: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(description),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Rp 100.000'), // Ganti dengan harga sesuai
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Tambahkan item ke dalam keranjang
                      },
                      child: const Text('Tambah ke Keranjang'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyWidget() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Godrej',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(height: 8),
          Image.network(
            'URL_TO_YOUR_COMPANY_LOGO', // Ganti dengan URL logo perusahaan
            height: 80,
            width: 80,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Implementasi tombol "Ikuti"
                },
                child: const Text('Ikuti'),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implementasi tombol "Bagikan"
                },
                child: const Text('Bagikan'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
