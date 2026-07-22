-- Migration: Add media_url column to posts and create follows table
-- Run this in Supabase SQL editor if tables already exist

-- Add media_url column to posts table
ALTER TABLE public.posts ADD COLUMN IF NOT EXISTS media_url TEXT;

-- Create follows table
CREATE TABLE IF NOT EXISTS public.follows (
    id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    follower_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    following_id UUID REFERENCES public.profiles(id) ON DELETE CASCADE NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc'::text, now()) NOT NULL,
    UNIQUE(follower_id, following_id),
    CHECK (follower_id != following_id)
);

-- Create indexes for follows table
CREATE INDEX IF NOT EXISTS idx_follows_follower_id ON public.follows(follower_id);
CREATE INDEX IF NOT EXISTS idx_follows_following_id ON public.follows(following_id);

-- Enable RLS on follows table
ALTER TABLE public.follows ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Follows are viewable by everyone" ON public.follows;
DROP POLICY IF EXISTS "Authenticated users can create follows" ON public.follows;
DROP POLICY IF EXISTS "Users can delete own follows" ON public.follows;

-- Create RLS policies for follows table
CREATE POLICY "Follows are viewable by everyone" ON public.follows
    FOR SELECT USING (true);
CREATE POLICY "Authenticated users can create follows" ON public.follows
    FOR INSERT WITH CHECK (auth.uid() = follower_id);
CREATE POLICY "Users can delete own follows" ON public.follows
    FOR DELETE USING (auth.uid() = follower_id);
