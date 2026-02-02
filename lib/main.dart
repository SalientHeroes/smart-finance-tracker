import 'package:flutter/material.dart';

void main() {
  runApp(const SmartFinanceTracker());
}

class SmartFinanceTracker extends StatelessWidget {
  const SmartFinanceTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Finance Tracker by Naim',
      theme: ThemeData(
        primarySwatch: Colors.green, // Islamic green theme
        fontFamily: 'Inter', // Clean font
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalBalance = 2543.50;
  double monthlyIncome = 3500.00;
  double monthlyExpenses = 956.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💰 Smart Finance Tracker by Naim'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // We'll add settings later
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'السلام عليكم',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Welcome to Your Finance Tracker',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard(
                          'Total Balance',
                          'RM ${totalBalance.toStringAsFixed(2)}',
                          Icons.account_balance_wallet,
                        ),
                        _buildStatCard(
                          'This Month',
                          'RM ${monthlyExpenses.toStringAsFixed(2)}',
                          Icons.trending_up,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Quick Actions Title
            const Text(
              'Quick Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Quick Actions Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _buildActionCard(
                  '➕ Add Transaction',
                  Icons.add_circle,
                  Colors.blue,
                  () {
                    print('Add Transaction tapped');
                  },
                ),
                _buildActionCard(
                  '📊 View Reports',
                  Icons.bar_chart,
                  Colors.blue,
                  () {
                    print('View Reports tapped');
                  },
                ),
                _buildActionCard(
                  '🏦 Import CSV',
                  Icons.upload_file,
                  Colors.orange,
                  () {
                    print('Import CSV tapped');
                  },
                ),
                _buildActionCard(
                  '🏷️ Categories',
                  Icons.category,
                  Colors.purple,
                  () {
                    print('Categories tapped');
                  },
                ),
                _buildActionCard(
                  '📋 Budget',
                  Icons.account_balance_wallet,
                  Colors.deepPurple,
                  () {
                    print('Budget tapped');
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Recent Transactions Title
            const Text(
              'Recent Transactions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Recent Transactions List
            Expanded(
              child: ListView(
                children: [
                  _buildTransactionTile(
                    'Food',
                    'Starbucks',
                    -25.80,
                    DateTime.now().subtract(const Duration(hours: 2)),
                  ),
                  _buildTransactionTile(
                    'Transport',
                    'Petronas',
                    -50.00,
                    DateTime.now().subtract(const Duration(days: 1)),
                  ),
                  _buildTransactionTile(
                    'Income',
                    'Salary',
                    3500.00,
                    DateTime.now().subtract(const Duration(days: 5)),
                  ),
                  _buildTransactionTile(
                    'Shopping',
                    'Uniqlo',
                    -129.90,
                    DateTime.now().subtract(const Duration(days: 3)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('FAB pressed - Add Transaction');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // Helper Widgets
  Widget _buildStatCard(String title, String value, IconData icon) {
    return Card(
      color: Colors.blue[50],
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 32, color: color),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionTile(
    String category,
    String description,
    double amount,
    DateTime date,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: amount > 0 ? Colors.green[100] : Colors.red[100],
          child: Icon(
            amount > 0 ? Icons.arrow_downward : Icons.arrow_upward,
            color: amount > 0 ? Colors.green : Colors.red,
          ),
        ),
        title: Text(description),
        subtitle: Text('$category • ${_formatDate(date)}'),
        trailing: Text(
          'RM ${amount.abs().toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: amount > 0 ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
