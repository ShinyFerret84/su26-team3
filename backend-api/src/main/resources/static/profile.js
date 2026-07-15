// Profile Page JavaScript
// Connects the page to the backend API using fetch()
// USER 1 story 
const CUSTOMER_ID = 1;
const API_BASE = '/api/customers';

// The HTML Elements
// Form inputs
const firstNameInput = document.getElementById('firstName');
const lastNameInput = document.getElementById('lastName');
const emailInput = document.getElementById('email');
const locationInput = document.getElementById('location');

// Display elements for the user's information/ User will see
const userName = document.getElementById('userName');
const userEmail = document.getElementById('userEmail');
const userLocation = document.getElementById('userLocation');
const userLocationDisplay = document.getElementById('userLocationDisplay');
const userMemberSince = document.getElementById('userMemberSince');
const avatarInitials = document.getElementById('avatarInitials');
const interestsCount = document.getElementById('interestsCount');

// Interest elements
const interestsContainer = document.getElementById('interestsContainer');
const interestInput = document.getElementById('interestInput');
const addInterestBtn = document.getElementById('addInterestBtn');

// Form and message
const profileForm = document.getElementById('profileForm');
const messageDiv = document.getElementById('message');

// Load profile this will get customer data from the database
async function loadProfile() {
    try {
        // Ask the backend for customer data
        const response = await fetch(`${API_BASE}/${CUSTOMER_ID}`);
        if (!response.ok) throw new Error('Failed to load profile');
        
        const customer = await response.json();
        
        // Fill in the form fields
        firstNameInput.value = customer.firstName || '';
        lastNameInput.value = customer.lastName || '';
        emailInput.value = customer.email || '';
        locationInput.value = customer.location || '';
        
        // Update the display (name, email, location, etc.)
        userName.textContent = `${customer.firstName || ''} ${customer.lastName || ''}`.trim() || 'User';
        userEmail.textContent = customer.email || 'No email set';
        userLocation.textContent = customer.location || 'No location set';
        userLocationDisplay.textContent = customer.location || 'No location set';
        userMemberSince.textContent = customer.memberSince ? `Member since ${customer.memberSince}` : 'Member since 2025';
        
        // Make the avatar with initials
        const firstInitial = customer.firstName ? customer.firstName.charAt(0).toUpperCase() : '?';
        const lastInitial = customer.lastName ? customer.lastName.charAt(0).toUpperCase() : '?';
        avatarInitials.textContent = `${firstInitial}${lastInitial}`;
        
        // Show their interests
        displayInterests(customer.interests || []);
        
        showMessage('Profile loaded successfully!', 'success');
    } catch (error) {
        console.error('Error loading profile:', error);
        showMessage('Could not load profile. Please try again.', 'error');
    }
}

// ============================================================
// DISPLAY INTERESTS - Shows interests as colorful tags
// ============================================================
function displayInterests(interests) {
    // If no interests, show a message
    if (!interests || interests.length === 0) {
        interestsContainer.innerHTML = '<p class="no-interests">No interests added yet. Start adding some!</p>';
        interestsCount.textContent = '0';
        return;
    }
    
    // Update the interest count
    interestsCount.textContent = interests.length;
    
    // Create HTML for each interest tag
    interestsContainer.innerHTML = interests.map(interest => `
        <span class="interest-tag">
            ${interest}
            <button class="remove-btn" data-interest="${interest}">×</button>
        </span>
    `).join('');
    
    // Add click listeners to all remove buttons
    document.querySelectorAll('.remove-btn').forEach(btn => {
        btn.addEventListener('click', () => removeInterest(btn.dataset.interest));
    });
}

// Save profile sends updated info to the backend 
profileForm.addEventListener('submit', async (e) => {
    e.preventDefault(); // Don't refresh the page
    
    // Collect the data from the form
    const customerData = {
        firstName: firstNameInput.value.trim(),
        lastName: lastNameInput.value.trim(),
        email: emailInput.value.trim(),
        location: locationInput.value.trim()
    };
    
    try {
        // Send the update to the backend
        const response = await fetch(`${API_BASE}/${CUSTOMER_ID}`, {
            method: 'PUT',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(customerData)
        });
        
        if (!response.ok) throw new Error('Failed to save profile');
        
        const updatedCustomer = await response.json();
        
        // Update the display with the new info
        userName.textContent = `${updatedCustomer.firstName || ''} ${updatedCustomer.lastName || ''}`.trim();
        userEmail.textContent = updatedCustomer.email || 'No email set';
        userLocation.textContent = updatedCustomer.location || 'No location set';
        userLocationDisplay.textContent = updatedCustomer.location || 'No location set';
        
        const firstInitial = updatedCustomer.firstName ? updatedCustomer.firstName.charAt(0).toUpperCase() : '?';
        const lastInitial = updatedCustomer.lastName ? updatedCustomer.lastName.charAt(0).toUpperCase() : '?';
        avatarInitials.textContent = `${firstInitial}${lastInitial}`;
        
        showMessage('Profile saved successfully! ✅', 'success');
        displayInterests(updatedCustomer.interests || []);
        
    } catch (error) {
        console.error('Error saving profile:', error);
        showMessage('Failed to save profile. Please try again.', 'error');
    }
});

// Add interest and sends a new interest to the backend
addInterestBtn.addEventListener('click', async () => {
    const interest = interestInput.value.trim();
    
    if (!interest) {
        showMessage('Please enter an interest!', 'error');
        return;
    }
    
    try {
        // Send the new interest to the backend
        const response = await fetch(`${API_BASE}/${CUSTOMER_ID}/interests`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ interest: interest })
        });
        
        if (!response.ok) {
            const error = await response.json();
            throw new Error(error.error || 'Failed to add interest');
        }
        
        const updatedCustomer = await response.json();
        
        // Show the updated list of interests
        displayInterests(updatedCustomer.interests || []);
        interestInput.value = ''; // Clear the input box
        showMessage(`"${interest}" added to your interests! 🎉`, 'success');
        
    } catch (error) {
        console.error('Error adding interest:', error);
        showMessage(error.message || 'Failed to add interest.', 'error');
    }
});

// Allow pressing Enter to add an interest
interestInput.addEventListener('keypress', (e) => {
    if (e.key === 'Enter') {
        e.preventDefault();
        addInterestBtn.click();
    }
});

// Remove interest it will tell the backend to delete an interest
async function removeInterest(interest) {
    try {
        // Tell the backend to remove this interest
        const response = await fetch(`${API_BASE}/${CUSTOMER_ID}/interests/${encodeURIComponent(interest)}`, {
            method: 'DELETE'
        });
        
        if (!response.ok) {
            const error = await response.json();
            throw new Error(error.error || 'Failed to remove interest');
        }
        
        const updatedCustomer = await response.json();
        
        // Show the updated list of interests
        displayInterests(updatedCustomer.interests || []);
        showMessage(`"${interest}" removed from your interests.`, 'success');
        
    } catch (error) {
        console.error('Error removing interest:', error);
        showMessage(error.message || 'Failed to remove interest.', 'error');
    }
}

// Show message and displays success or error messages
function showMessage(text, type = 'success') {
    messageDiv.textContent = text;
    messageDiv.className = `message ${type}`;
    messageDiv.classList.remove('hidden');
    
    // Auto-hide after 4 seconds
    clearTimeout(window.messageTimeout);
    window.messageTimeout = setTimeout(() => {
        messageDiv.classList.add('hidden');
    }, 4000);
}

// Will start loading the profile when the page opens
document.addEventListener('DOMContentLoaded', loadProfile);