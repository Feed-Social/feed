-- Seed Data for Feed Social Media App
-- Run this AFTER creating users via the Supabase Auth dashboard or API
-- Replace the UUIDs below with actual user IDs from your auth.users table

-- Sample posts (replace UUIDs with actual user IDs from auth.users)
-- To get user IDs: SELECT id, email FROM auth.users;

-- Example: After creating 2-3 test users in the Auth dashboard, run:
-- INSERT INTO public.posts (user_id, content, likes_count, comments_count) VALUES
-- ('<user-uuid-1>', 'Just joined Feed! Excited to be here. #HelloWorld', 5, 2),
-- ('<user-uuid-2>', 'Working on a new project. Can''t wait to share it with everyone! 🚀', 12, 4),
-- ('<user-uuid-1>', 'Beautiful sunset today. Sometimes you need to stop and appreciate the little things. 🌅', 8, 3);

-- Sample likes (after creating posts)
-- INSERT INTO public.likes (post_id, user_id) VALUES
-- ('<post-uuid-1>', '<user-uuid-2>'),
-- ('<post-uuid-2>', '<user-uuid-1>'),
-- ('<post-uuid-1>', '<user-uuid-3>');

-- Sample comments (after creating posts)
-- INSERT INTO public.comments (post_id, user_id, content) VALUES
-- ('<post-uuid-1>', '<user-uuid-2>', 'Welcome to Feed! Great to have you here.'),
-- ('<post-uuid-2>', '<user-uuid-1>', 'Looking forward to seeing what you build!'),
-- ('<post-uuid-1>', '<user-uuid-3>', 'Hello! 👋');

-- To add verification badges to users:
-- UPDATE public.profiles SET verification_badge = 'blue' WHERE username = 'someuser';
-- UPDATE public.profiles SET verification_badge = 'gold' WHERE username = 'anotheruser';
