# 🔧 Development Guide - D&V Technologies Platform

This guide provides comprehensive instructions for developers working on the D&V Technologies secure payment platform, featuring AI voice technology and enterprise-grade security.

## 🏁 Quick Setup

### Automated Setup (Windows PowerShell)
```powershell
# Run the setup script (recommended)
.\setup-dev.ps1
```

### Manual Setup
```bash
# Install dependencies
npm install

# Copy environment variables
cp env.example .env.local

# Start development server
npm start
```

## 🏗️ Project Architecture

### Frontend Structure
```
src/
├── components/           # Reusable UI components
│   └── SecureMpesaDemo.jsx
├── App.js               # Main application component
├── App.css              # Component-specific styles
├── index.js             # React DOM entry point
└── index.css            # Global styles (Tailwind imports)
```

### Key Components

#### SecureMpesaDemo.jsx
**Main Features:**
- Voice recognition integration
- Transaction form handling
- Privacy controls (amount/phone masking)
- Real-time status updates
- Demo transaction processing

**State Management:**
```javascript
const [isListening, setIsListening] = useState(false);
const [phoneNumber, setPhoneNumber] = useState('');
const [amount, setAmount] = useState('');
const [hideAmount, setHideAmount] = useState(true);
const [status, setStatus] = useState('');
```

## 🎯 Development Workflow

### 1. Feature Development
```bash
# Create feature branch
git checkout -b feature/your-feature-name

# Make changes
# Test locally
npm start

# Commit changes
git add .
git commit -m "feat: add your feature description"
```

### 2. Voice Command Enhancement
```javascript
// Add new voice commands in processVoiceCommand()
const processVoiceCommand = (text) => {
  // Existing patterns...
  const newCommandMatch = text.match(/your new pattern/i);
  if (newCommandMatch) {
    // Handle new command
    handleNewCommand(newCommandMatch[1]);
  }
};
```

### 3. UI Component Updates
```javascript
// Add new UI elements in the return statement
return (
  <div>
    {/* Existing components */}
    <YourNewComponent />
  </div>
);
```

## 🧪 Testing

### Manual Testing Checklist
- [ ] Voice recognition works in Chrome/Safari
- [ ] Transaction form validation
- [ ] Privacy masking functionality
- [ ] Mobile responsiveness
- [ ] Error handling
- [ ] Accessibility (screen readers)

### Voice Commands to Test
- "Send 500 shillings to 0712345678"
- "Pay 2000 to 0798765432"
- "Show amount" / "Hide amount"
- "Use test number"
- "Cancel transaction"

## 🎨 Styling Guide

### Tailwind CSS Classes Used
- **Backgrounds**: `bg-gradient-to-br from-green-900 via-green-800 to-emerald-900`
- **Buttons**: `bg-gradient-to-r from-green-600 to-emerald-600`
- **Inputs**: `border border-gray-300 rounded-xl focus:ring-2 focus:ring-green-500`
- **Text**: `text-gray-700`, `text-green-800`

### Custom Color Palette
```css
/* M-Pesa Brand Colors */
--mpesa-green: #1F7A1F;
--mpesa-light-green: #4CAF50;
--mpesa-dark-green: #0D5C0D;
```

### Responsive Design
- Mobile-first approach
- Breakpoints: `sm:`, `md:`, `lg:`
- Touch targets: minimum 44px height

## 🔊 Voice Recognition

### Browser Support
- ✅ Chrome/Chromium (full support)
- ✅ Safari (iOS full support)
- ✅ Firefox (partial support)
- ❌ Internet Explorer (not supported)

### Voice Command Patterns
```javascript
// Phone number extraction
const phoneMatch = text.match(/(\d{10}|\d{12})/);

// Amount extraction
const amountMatch = text.match(/(\d+)\s*(shillings|bob|kenya shillings)/i);
```

### Error Handling
```javascript
recognition.onerror = () => {
  setStatus('Voice recognition not available. Use manual input.');
};
```

## 📱 Mobile Development

### Viewport Configuration
```html
<!-- public/index.html -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
```

### Touch Interactions
- Voice button: Large touch target (py-4)
- Form inputs: Proper keyboard types
- Gestures: Tap to speak, swipe to cancel

## 🔒 Security Considerations

### Client-Side Security
- No sensitive data stored in localStorage
- Voice data processed locally only
- No API keys exposed in frontend
- Input validation and sanitization

### Privacy Features
- Amount masking by default
- Phone number concealment
- No transaction history display
- Session-based operation only

## 🚀 Deployment

### Development Deployment
```bash
npm run build
npm run serve
```

### Production Deployment
```bash
npm run build
# Deploy build/ folder to hosting service
```

### Environment Variables
```bash
# Copy and configure
cp env.example .env.local

# Required for production
REACT_APP_BACKEND_URL=https://api.yourdomain.com
REACT_APP_MPESA_CONSUMER_KEY=your_key_here
```

## 🔧 Troubleshooting

### Common Issues

**Voice Recognition Not Working**
- Check browser permissions
- Ensure HTTPS in production
- Test with different microphones

**Tailwind Styles Not Applying**
- Verify CSS imports in index.css
- Check build process
- Clear browser cache

**Mobile Responsiveness Issues**
- Test with browser dev tools
- Check viewport meta tag
- Verify touch targets

### Debug Commands
```bash
# Check React version
npm list react

# Clear npm cache
npm cache clean --force

# Rebuild node_modules
rm -rf node_modules && npm install
```

## 📋 Code Quality

### Linting
```bash
npm run lint      # Check for issues
npm run lint:fix  # Auto-fix issues
```

### Formatting
```bash
npm run format    # Format code with Prettier
```

### Git Hooks (Future)
- Pre-commit: lint and format
- Pre-push: run tests

## 🔄 Future Enhancements

### Planned Features
- [ ] Offline transaction queuing
- [ ] Biometric authentication
- [ ] Multi-language support
- [ ] Transaction history (encrypted)
- [ ] Emergency contact integration

### Backend Integration
- [ ] M-Pesa Daraja API
- [ ] Secure token management
- [ ] Transaction monitoring
- [ ] User authentication

## 📞 Support

**Company**: D&V Technologies Ltd
**Technical Lead**: David Ndegwa (+254 759 075 816)
**Email**: tech@dvtechnologies.co.ke
**Technology Stack**: React + Tailwind CSS + Web Speech API + AI Voice Processing
**Business Focus**: FinTech innovation and secure payment solutions

---

**⚠️ Important**: This is currently a demonstration system. All transactions are simulated and no real money transfers occur.
