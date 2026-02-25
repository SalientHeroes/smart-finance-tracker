import 'package:flutter/material.dart';
import 'screens/add_transaction_screen.dart';

// ============ DATA STORAGE ============
// Think of this as your MONEY NOTEBOOK 📒

// List to store ALL transactions (like pages in notebook)
List<Map<String, dynamic>> transactions = [
  // Sample data (like example entries in notebook)
  {
    'description': 'Starbucks',
    'amount': -25.80,
    'category': 'Food',
    'date': DateTime.now().subtract(const Duration(hours: 2)),
    'id': 1,
  },
  {
    'description': 'Petronas',
    'amount': -50.00,
    'category': 'Transport',
    'date': DateTime.now().subtract(const Duration(days: 1)),
    'id': 2,
  },
  {
    'description': 'Salary',
    'amount': 3500.00,
    'category': 'Income',
    'date': DateTime.now().subtract(const Duration(days: 5)),
    'id': 3,
  },
  {
    'description': 'Uniqlo',
    'amount': -129.90,
    'category': 'Shopping',
    'date': DateTime.now().subtract(const Duration(days: 3)),
    'id': 4,
  },
];

// Function to add new transaction (like writing new page)
void addTransaction(Map<String, dynamic> newTransaction) {
  transactions.insert(0, newTransaction); // Add at beginning
}
// ============ END DATA STORAGE ============

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
  // These will now calculate from REAL data!
  double get totalBalance {
    return transactions.fold(0.0, (sum, t) => sum + t['amount']);
  }

  double get monthlyExpenses {
    return transactions
        .where((t) => t['amount'] < 0)
        .fold(0.0, (sum, t) => sum + t['amount'])
        .abs(); // Make positive
  }

  double get monthlyIncome {
    return transactions
        .where((t) => t['amount'] > 0)
        .fold(0.0, (sum, t) => sum + t['amount']);
  }

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
      // 🎯 FIX 1: ADD SINGLE CHILD SCROLL VIEW (LIKE YOUTUBE SCROLL!)
      body: SingleChildScrollView(
        child: Padding(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddTransactionScreen(),
                        ),
                      );
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
              transactions.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.0),
                      child: Center(
                        child: Text(
                          '📝 No transactions yet!\nTap + to add your first expense.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    )
                  : ListView(
                      // 🎯 FIX 2: ADD SHRINK WRAP (TELLS LIST TO BE SMALL)
                      shrinkWrap: true,
                      // 🎯 FIX 3: ADD PHYSICS (STOPS NESTED SCROLLING)
                      physics: const NeverScrollableScrollPhysics(),
                      children: transactions.map((transaction) {
                        return _buildTransactionTile(
                          transaction['category'],
                          transaction['description'],
                          transaction['amount'],
                          transaction['date'],
                        );
                      }).toList(),
                    ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTransactionScreen(),
            ),
          );
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
